### R code from vignette source 'items/items.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: setup
###################################################
source("/home/fortis/goals-2013/descriptives/descriptives.R")
library(psych)


###################################################
### code chunk number 2: alpha
###################################################
al <- alpha(gp.rw)
al


###################################################
### code chunk number 3: cttDiscrim
###################################################
r.cor <- al$item.stats$r.cor
names(r.cor) <- 1:23
barplot(rev(r.cor), horiz = T, las = 2, main = "Item discrimination (r.cor)")
abline(v=0.2, col = "red")


###################################################
### code chunk number 4: distractors.setup
###################################################
source("/home/fortis/goals-2013/functions.R")

d06 <- distractors("q06", gp)
lab06 <- "Sample size may be why not significant"
d09 <- distractors("q09", gp)
lab09 <- "Variability difference"
d13 <- distractors("q13", gp)
lab13 <- "CI width difference"
d23 <- distractors("q23", gp)
lab23 <- "p-value comparison"


###################################################
### code chunk number 5: distract06
###################################################
plq06 <- ggplot(d06, aes(pct.minus, scalecount, color = col)) +
    geom_line() +
    theme_bw() +
    xlab("Proportion correct (excluding this item)") +
    ylab("Students") +
    ggtitle("Herbicide/sample size (q06)") +
    coord_cartesian(ylim = c(0, 1)) + 
    scale_color_discrete(name = lab06) +
    theme(legend.position = "top")
print(plq06)


###################################################
### code chunk number 6: items.Rnw:91-92
###################################################
round(prop.table(table(gp$q06)), 2)


###################################################
### code chunk number 7: distract09
###################################################
## name conflict with %+%, which is why I need to use colon notation here

plq09 <- ggplot2::"%+%"(plq06, d09) + 
    scale_color_discrete(name = lab09) +
    ggtitle("Candies problem (q09)")
plq09


###################################################
### code chunk number 8: items.Rnw:110-111
###################################################
round(prop.table(table(gp$q09)), 2)


###################################################
### code chunk number 9: distract13
###################################################
## name conflict with %+%, which is why I need to use colon notation here

plq13 <- ggplot2::"%+%"(plq06, d13) +
    scale_color_discrete(name = lab13) +
    ggtitle("CIs and sample size (q13)")
plq13


###################################################
### code chunk number 10: items.Rnw:125-126
###################################################
round(prop.table(table(gp$q13)), 2)


###################################################
### code chunk number 11: distract23
###################################################
## name conflict with %+%, which is why I need to use colon notation here

plq23 <- ggplot2::"%+%"(plq06, d23) + 
    scale_color_discrete(name = lab23) +
    ggtitle("P-value and sample size (q23)")
plq23


###################################################
### code chunk number 12: items.Rnw:148-149
###################################################
round(prop.table(table(gp$q23)), 2)


