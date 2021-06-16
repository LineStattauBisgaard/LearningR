#load up the packages
source(here::here("R/package-loading.R"))

# Briefly glimpse content of dataset

glimpse(NHANES)

#vælg kolonne via dets navn (indtaster først datsættets navn
#og så de kolonner man ønsker at vælge)
select(NHANES, Age)

#select more columns
select(NHANES, Age, Weight, BMI)

# exclude a column
select(NHANES, -HeadCirc)

#select all columns starting with "BP"
select(NHANES, starts_with("BP"))

#select all columns ending with "Day"
select(NHANES, ends_with("Day"))

#GENEREL INFO: somudgangspunkt bruges "" når man
#referer til tekst, men er der tale om kolonnenavn
#behøver man ikke - men ikkefuldstændig standardiseret

#all columns containing "Age"
select(NHANES, contains("Age"))

#save subset of NHANES dataset in new data frame

nhanes_small <- select(NHANES, Age, Gender, Height,
                       Weight, BMI, Diabetes, DiabetesAge,
                       PhysActiveDays, PhysActive, TotChol,
                       BPSysAve, BPDiaAve, SmokeNow, Poverty)

nhanes_small

##renaming
#Rename all columns to snake case

nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)

nhanes_small

#ikke altid brugbar - havde kolonnenavn eks været diabetesage kan
#den ikke adskille de to ord

rename(nhanes_small, sex = gender)

nhanes_small <- rename(nhanes_small, sex = gender)

nhanes_small

## the pipe operator

#without the pipe operator
colnames(nhanes_small)

#with pipe operator
nhanes_small %>%
    colnames()

#using the pipe operator with more functions
#physically_active = new name
#phys_active = old name
nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active = phys_active)
