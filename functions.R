library(plyr)
library(psych)
library(car)
library(ggplot2)
library(corrgram)

distractors <- function(qname, data) {
    ## Calculate proportion of each distractor for each total score level
    ## Assumes 'data' is in traditional delMas form, with qXX and qXX.rw columns
    ## qname: question column name, string

    if(deparse(substitute(data)) == "caos")
        total <- 40
    else if (deparse(substitute(data)) == "gp")
        total <- 23

    col <- data[[qname]]
    include <- !is.na(col) & !(col %in% "X") # i think the %in% X bit is something that came up in old GOALS or CAOS, it's not in G2013

    rw <- paste0(qname, ".rw") # The dot is needed in gp, maybe not for older ones
    total.minus <- data$total.correct - data[[rw]]
    pct.minus <- (total.minus/(total - 1))[include]

    col <- factor(col[include])

    both <- data.frame(pct.minus, col)

    agged <- aggregate(factor(pct.minus) ~ pct.minus + col, both, length)

    names(agged) <- c("pct.minus", "col", "rawcount")
    aggedmax <- aggregate(rawcount ~ pct.minus, agged, sum)
    names(aggedmax) <- c("pct.minus", "sumcount")

    aggedall <- join(agged, aggedmax)
    aggedall$scalecount <- aggedall$rawcount/aggedall$sumcount

    return(aggedall[aggedall$sumcount > 4,])
}
