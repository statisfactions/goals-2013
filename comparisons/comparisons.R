### R code from vignette source '/home/fortis/goals-2013/comparisons/comparisons'
### Encoding: UTF-8

###################################################
### code chunk number 1: setup
###################################################
source("/home/fortis/goals-2013/items/items.R")


###################################################
### code chunk number 2: comparisons.Rnw:45-46
###################################################
mosaicplot(with(gp, table(q06, q09)), color=T)


###################################################
### code chunk number 3: comparisons.Rnw:49-50
###################################################
mosaicplot(with(gp, table(q06, q13)), color=T)


###################################################
### code chunk number 4: comparisons.Rnw:53-54
###################################################
mosaicplot(with(gp, table(q06, q23)), color=T)


###################################################
### code chunk number 5: comparisons.Rnw:59-60
###################################################
mosaicplot(with(gp, table(q09, q13)), color=T)


###################################################
### code chunk number 6: comparisons.Rnw:63-64
###################################################
mosaicplot(with(gp, table(q09, q23)), color=T)


###################################################
### code chunk number 7: comparisons.Rnw:68-69
###################################################
mosaicplot(with(gp, table(q13, q23)), color=T)


