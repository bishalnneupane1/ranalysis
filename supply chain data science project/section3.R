## dplyr : this is for data manipulation
## lubricate: for working with dates
## readr : for reading files
## forecast package: for forecasting
## invetorize: for inventory management and revenue management
## tidyr : for data cleaning
## stringer : for playing with strings
## ggplot: for data visualizations

## install.packages("dplyr")


#creating a vector

#length_class <- c(1.7,1.75,1.78,1.8,1.9)
#length_class

### importing data in R
library(readr)
retail_trans<- read_csv("online_retail2.csv")

### to have general info about the structure of the dataset/dataframe

str(retail_trans)


### a couple of lines

head(retail_trans)

### number of rows

nrow(retail_trans)

### number of columns

ncol(retail_trans)


## name of the columns

names(retail_trans)


### change columns names
names(retail_trans)[7] <- "Customer_id"

## summary of the data

summary(retail_trans)

### how to bring one column
retail_trans$Country

## searching other country than united kingdom , getting unique values
unique(retail_trans$Country)

### information on categorial variables

table(retail_trans$Country)





### Selecting Data in a dataframe

## retail_trans[row, column]

retail_trans[1:5,]

retail_trans[c(1,2,3,4,5),]

retail_trans[1:5,] == retail_trans[c(1,2,3,4,5),]


five_rows <- retail_trans[1:5,]
five_rows

### subsetting columns
invoice_quantity <- retail_trans[,c(1,4)]
invoice_quantity

retail_trans[,c("Invoice", "Quantity")] == invoice_quantity


### subset both columns and rows

retail_trans[1:10,c("Country")]


### how to get the observation of france

unique(retail_trans$Country)

france = retail_trans[retail_trans$Country== "France",]

### negative quantities

negative_data <- retail_trans[retail_trans$Quantity <= 0,]
negative_data

summary(retail_trans)

### removing negatives
retail_trans$Quantity[retail_trans$Quantity <= 0]<- 0

summary(retail_trans)

retail_trans[retail_trans$Quantity < 0,]


### functions in R

operation_function <- function(x,y){
  addition <- x + y
  substraction <- x - y
  multiplication <- x*y
  division <- x/y
  power1 <- x^y
  
  return(c(addition=addition,
           multiplication=multiplication,
           division=division,
           subtraction=substraction,
           power1=power1))
}

operation_function(5,2)


unique(retail_trans$Country)

### creating a new column called united kingdom.

### ifelse loop

retail_trans$united_kingdom <- ifelse(retail_trans$Country == "United Kingdom",TRUE,FALSE)

table(retail_trans$united_kingdom)


## functions with conditions

person <- function(x){
  if(x <= 15){
    "child"
  } else if(x <= 20){
    "teenager"
  }else {"adult"}
}

person(5)


