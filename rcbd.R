#code for anova and lsd in RCBD in R
library(readr)
Book1 <- read_csv("C:/Users/bisha/Downloads/Book1.csv")
Book1$rep =as.factor(Book1$rep)Book1$trt =as.factor(Book1$trt)
kapil= gvlma(ph~rep+trt,data=Book1)
summary(kapil)
bishal = anova(kapil)
bishal
binay = bishal$Df[3]
darpan = bishal$`Mean Sq`[3]
lsd = with(Book1,LSD.test(ph, trt, binay, darpan))
lsd
dmrt = with(Book1, duncan.test(ph, trt, binay, darpan))
dmrt
hsd = with(Book1, HSD.test(ph, trt, binay, darpan))
hsd

#Code for anova and lsd in CRd in R
#library(readr)
#require(gvlma)
#require(agricolae)
#Book1 <- read_csv("C:/Users/bisha/Downloads/Book1.csv")
#Book1$trt = as.factor(Book1$trt)
#bishal= gvlma(ph~trt,data=Book1)
#summary(bishal)
#crdanova = anova(bishal)
#crdanova
#ess = crdanova$Df[2]
#ems = crdanova$`Mean Sq`[2]
#lsd = with(Book1,LSD.test(ph, trt, ess, ems))
#lsd

boxplot(Book1$ph)
#
