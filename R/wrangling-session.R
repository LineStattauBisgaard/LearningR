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

##Filtering
#Filter for all females

nhanes_small %>%
    filter(sex == "female")

#Participants who are not female
nhanes_small %>%
    filter(sex != "female")

#participants who have BMI equal to 25
nhanes_small %>%
    filter(bmi == 25)

nhanes_small %>%
    filter(bmi >= 25)

# BMI greater than 25 AND sex is female
nhanes_small %>%
    filter(bmi > 25 & sex == "female")

# either greater than 25 OR sex is female

nhanes_small %>%
    filter(bmi > 25 | sex == "female")

##Arranging data

#arranging by age in ascending order
nhanes_small %>%
    arrange(age)

#arranging by sex in ascending order
nhanes_small %>%
    arrange(sex)

#arranging by age in descending order
nhanes_small %>%
    arrange(desc(age))

#arranging by sex then age in ascending order
nhanes_small %>%
    arrange(sex, age)

#arranging by descending for sex then age in ascending order
nhanes_small %>%
    arrange(desc(sex), age)

## Transform or add columns

#height in meters
nhanes_small %>%
    mutate(height = height / 100)

# Add a new columnn with logged height values
nhanes_small %>%
    mutate(logged_height = log(height))

# modify more than 1 new columnn
nhanes_small %>%
    mutate(height = height / 100,
           logged_height = log(height))

#New column based on how active participants are
nhanes_small %>%
    mutate(highly_active = if_else(phys_active_days >= 5, "Yes", "No"))

nhanes_update <- nhanes_small %>%
    mutate(height = height / 100,
           logged_height = log(height),
           highly_active = if_else(phys_active_days >= 5, "Yes", "No"))

str(nhanes_update)

## summary statistics by group

#find max BMI
nhanes_small %>%
    summarise(max_bmi = max(bmi))

#doesnt work doue to NA values in datatable
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE))

#how to get information on how many NA's the column includes
nhanes_small %>%
    summarise(sum_na = sum(is.na(bmi)))

#luke - but maybe easier to use summary function toget this info

#calculating 2 summary statistics
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE),
              min_bmi = min(bmi, na.rm = TRUE))
