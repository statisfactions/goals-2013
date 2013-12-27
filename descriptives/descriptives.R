### R code from vignette source 'descriptives.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: setup
###################################################
library(car)

gp.raw <- read.csv("/home/fortis/goals-2013/data-in/GOALS-DEIDENTIFIED-2013-12-20.csv")

## Exclude non-consenting
summary(factor(gp.raw$consent)) ## no missing values; 38 nonconsenting, 1165 consenting
gp <- gp.raw[ gp.raw$consent == 1, ] ## 2 = non-consenting

## Replace response numeric codes with factors for reasonable summarizing
responsecols <- grep("^q..$", names(gp), value = T)
gp[,responsecols] <- lapply(gp[,responsecols], factor)

rwcols <- paste0(responsecols, ".rw")
gp.rw <- gp[, rwcols]


###################################################
### code chunk number 2: descriptives.Rnw:53-69
###################################################
## Add response options

## sampling items
gp$q06 <- factor(gp$q06, labels = c("Valid", "Invalid"))
gp$q09 <- factor(gp$q09, labels = c("Same", "Small n is wider", "Large n is wider"))
gp$q13 <- factor(gp$q13, labels = c("Small n is wider", "Large n is wider", "Same"))
gp$q23 <- factor(gp$q23, labels = c("Smaller than original", "Same as original", "Larger than original"))

## center items
gp$q10 <- factor(gp$q10, labels = c("Standard medication", "New medication", "Neither"))
gp$q11 <- factor(gp$q11, labels = c("Smaller difference", "Larger difference", "Same evidence"))

## Variability items

gp$q08 <- factor(gp$q08, labels = c("Uniform", "Unimodal", "Neither"))
gp$q12 <- factor(gp$q12, labels = c("Smaller variability", "Larger variability", "Same evidence"))


###################################################
### code chunk number 3: descriptives.Rnw:74-75
###################################################
table(gp$missing)


###################################################
### code chunk number 4: corrgram
###################################################
library(corrgram)
corrgram(gp.rw, cex.labels = 1.5, lower.panel = panel.shade, upper.panel = panel.pie)


###################################################
### code chunk number 5: percentCorrect
###################################################
library(ggplot2)

pc <- colMeans(gp.rw, na.rm = T)
round(pc, 2)

names(pc) <- 1:23
barplot(pc)


###################################################
### code chunk number 6: sample.size
###################################################
samps <- c("q06", "q09", "q13", "q23")
samps.rw <- paste0(samps, ".rw")

summary(gp[,sort(c(samps, samps.rw))])
round(cor(gp[,samps.rw], use = "complete.obs"), 2)


###################################################
### code chunk number 7: central
###################################################
cents <- c("q10", "q11")
cents.rw <- paste0(cents, ".rw")

summary(gp[,sort(c(cents, cents.rw))])
round(cor(gp[,cents.rw], use = "complete.obs"), 2)


###################################################
### code chunk number 8: variability
###################################################
vars <- c("q08", "q12")
vars.rw <- paste0(vars, ".rw")

summary(gp[,sort(c(vars, vars.rw))])
round(cor(gp[,vars.rw], use = "complete.obs"), 2)


