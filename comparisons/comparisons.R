### R code from vignette source '/home/fortis/goals-2013/comparisons/comparisons'
### Encoding: UTF-8

###################################################
### code chunk number 1: setup
###################################################
source("/home/fortis/goals-2013/items/items.R")


###################################################
### code chunk number 2: comparisons.Rnw:46-50
###################################################
(tq06q09 <- with(gp, table(q06, q09)))

t(round(prop.table(tq06q09, margin = 1), 2))
round(prop.table(tq06q09, margin = 2), 2)


###################################################
### code chunk number 3: comparisons.Rnw:56-60
###################################################
(tq06q13 <- with(gp, table(q06, q13)))

t(round(prop.table(tq06q13, margin = 1), 2))
round(prop.table(tq06q13, margin = 2), 2)


###################################################
### code chunk number 4: comparisons.Rnw:66-70
###################################################
(tq06q23 <- with(gp, table(q06, q23)))

t(round(prop.table(tq06q23, margin = 1), 2))
round(prop.table(tq06q23, margin = 2), 2)


###################################################
### code chunk number 5: comparisons.Rnw:79-83
###################################################
(tq09q13 <- with(gp, table(q09, q13)))

t(round(prop.table(tq09q13, margin = 1), 2))
round(prop.table(tq09q13, margin = 2), 2)


###################################################
### code chunk number 6: comparisons.Rnw:91-95
###################################################
(tq09q23 <- with(gp, table(q09, q23)))

t(round(prop.table(tq09q23, margin = 1), 2))
round(prop.table(tq09q23, margin = 2), 2)


###################################################
### code chunk number 7: comparisons.Rnw:108-112
###################################################
(tq13q23 <- with(gp, table(q13, q23)))

t(round(prop.table(tq13q23, margin = 1), 2))
round(prop.table(tq13q23, margin = 2), 2)


