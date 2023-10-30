library(readxl)
Book <- read_excel("C:/Users/bisha/OneDrive - bishalnneupane/Desktop/r analysis/irrigation.xlsx")

Book$fertilizer = as.factor(Book$fertilizer)
Book$irrigation = as.factor(Book$irrigation)
Book$block = as.factor(Book$block)

require(gvlma)
require(agricolae)

bishal = gvlma.lm(yield~block+fertilizer*irrigation, data=Book)
bishal

binay = anova(bishal)
binay

edf = binay$Df[5]
ems = binay$`Mean Sq`[5]

lsd = with(Book, LSD.test())
lsd
