source(here::here("R/package-loading.R"))
#source- tror nok det betød at den kører alt i en fil

#here::here er en komando til at få R til at gå
#tilbage til basen. (her "learning R basefolder)
#setwd() skal man IKKE bruge - noget med at man kan
#få rodet rundt i hvor ting faktisk bliver gemt. isedet skalman bruge here::here

# man kan bruge help() eller ? for at få hjælp til function
#eks.:help(colnames) eller ?colnames

# Basics of R -------------------------------------------------------------

Weight_kilos<- 100
Weight_kilos

c("a", "b", "c")
#character - ingen numre forbundet til dette. så det bliver bare en
c(TRUE, FALSE)
c(1, 2, 4)
factor(c("high", "medium", "low"))
# factor omdanner character-vector til factor-vector
#- dvs det assigner nummer til hver del i vectoren

head(CO2)
#giver dig de første 6 rækker i dataframe
head(CO2, 10)
#giver dig de første 10 rækker
colnames(CO2)
#
str(CO2)
#str() gives you structure. Not always yousefull
summary(CO2)
#often usefull - gives you simple statistic on your dataframe

#exercise7.10
Day_One #day_one
T <- FALSE #T er r-code for true så det
c <- 9 #c er allerede en function så du overskriver c med "9" hvilket kan give problemer senere

# Spacing
x[,1] #x[, 1]
x[ ,1] #x[, 1]
mean (x, na.rm = TRUE) #mean(x, na.rm = TRUE)
mean( x, na.rm = TRUE ) #mean(x, na.rm = TRUE)
height<-feet*12+inches #height <- feet*12 + inches
df $ z #df$z
x <- 1 : 10 #x <- 1:10

# Indenting and brackets
if (y < 0 && debug) {
    message("Y is negative")}

#if(y < 0 && debug) {
#    message("Y is negative")
    }
#
DayOne
T <- FALSE
c <- 9

# Spacing
x[, 1]
x[, 1]
mean (x, na.rm = TRUE)
mean(x, na.rm = TRUE)
height <- feet * 12 + inches
df$z
x <- 1:10

# Indenting and brackets
if (y < 0 && debug) {
    message("Y is negative")
}
## man kan rette styled ctrl, shift, A, eller bruge styler::style_file()




