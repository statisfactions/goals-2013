### R code from vignette source '/home/fortis/goals-2013/comparisons/comparisons'
### Encoding: UTF-8

###################################################
### code chunk number 1: setup
###################################################
source("/home/fortis/goals-2013/functions.R")
load(file = "/home/fortis/goals-2013/data-in/g2013-clean.Rda")


###################################################
### code chunk number 2: comparisons.Rnw:44-48
###################################################
(tq06q09 <- with(gp, table(q06, q09)))

t(round(prop.table(tq06q09, margin = 1), 2))
round(prop.table(tq06q09, margin = 2), 2)


###################################################
### code chunk number 3: comparisons.Rnw:54-58
###################################################
(tq06q13 <- with(gp, table(q06, q13)))

t(round(prop.table(tq06q13, margin = 1), 2))
round(prop.table(tq06q13, margin = 2), 2)


###################################################
### code chunk number 4: comparisons.Rnw:64-68
###################################################
(tq06q23 <- with(gp, table(q06, q23)))

t(round(prop.table(tq06q23, margin = 1), 2))
round(prop.table(tq06q23, margin = 2), 2)


###################################################
### code chunk number 5: comparisons.Rnw:77-81
###################################################
(tq09q13 <- with(gp, table(q09, q13)))

t(round(prop.table(tq09q13, margin = 1), 2))
round(prop.table(tq09q13, margin = 2), 2)


###################################################
### code chunk number 6: comparisons.Rnw:89-93
###################################################
(tq09q23 <- with(gp, table(q09, q23)))

t(round(prop.table(tq09q23, margin = 1), 2))
round(prop.table(tq09q23, margin = 2), 2)


###################################################
### code chunk number 7: comparisons.Rnw:106-110
###################################################
(tq13q23 <- with(gp, table(q13, q23)))

t(round(prop.table(tq13q23, margin = 1), 2))
round(prop.table(tq13q23, margin = 2), 2)


###################################################
### code chunk number 8: small.corr
###################################################
allsamps <- c("q06", "q09", "q13", "q23")
allsamps.rw <- paste0(allsamps, ".rw")

round(cor(gp[,allsamps.rw], use = "complete.obs"), 2)


###################################################
### code chunk number 9: same.corr
###################################################
samps3 <- allsamps[-1]

same <- data.frame(lapply(gp[,samps3], function(x) {
    out <- rep(FALSE, length(x))
    out[is.na(x)] <- NA
    out[grep("^Same", x)] <- TRUE
    out
}))

round(cor(same, use = "complete.obs"), 2)


###################################################
### code chunk number 10: larger.corr
###################################################
larger <- data.frame(lapply(gp[,samps3], function(x) {
    out <- rep(FALSE, length(x))
    out[is.na(x)] <- NA
    out[grep("^Large", x)] <- TRUE
    out
}))

round(cor(larger, use = "complete.obs"), 2)


