# Load the packages
source(here::here("R/package-loading.R"))

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

##pipe excercise
nhanes_small %>%
    select(tot_chol, bp_sys_ave, poverty)

nhanes_small %>%
    rename(diabetes_diagnosis_age = diabetes_age)

nhanes_small %>%
    select(bmi, select(contains("age"))


physical_activity <- select(nhanes_small, phys_active_days, phys_active)
rename(physical_activity, days_phys_active = phys_active_days)

nhanes_small %>%
    select(phys_active_days, phys_active) %>%
    rename(days_phys_active = phys_active_days)

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
