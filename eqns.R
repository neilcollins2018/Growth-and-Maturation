### Function designed to return age as a decimal when only date of birth and 
### date of testing supplied
## Will deal with date in character format
get_age <- function(from_date,to_date = lubridate::now(),dec = TRUE){
  if(
    is.character(from_date)
    ) from_date <- lubridate::as_date(from_date)
  if(
    is.character(to_date)
    )   to_date   <- lubridate::as_date(to_date)
  if (
    dec
    ) { 
    age <- lubridate::interval(start = from_date, end = to_date) /
    (lubridate::days(365) + lubridate::hours(6))
  } else   { 
    age <- lubridate::year(lubridate::as.period(lubridate::interval(
    start = from_date, end = to_date)))
    }
  age
}

### Returns Maturity ratio which can be used to calculate age at PHV
# Based on Fransen et al. (2017). Improving the Prediction of Maturity From 
# Anthropometric Variables Using a Maturity Ratio. Pediatric Exercise Science.
FransenMaturityRatio <- function(age, bodymass, stature, sittingheight) {
  
  leglenth <- stature - sittingheight
  
  (6.986547255416 + 
  (0.115802846632 * age) +
  (0.001450825199 * age ^ 2) + 
  (0.004518400406 * bodymass) - 
  (0.000034086447 * bodymass ^ 2) -
  (0.151951447289 * stature) + 
  (0.000932836659 * stature ^ 2) - 
  (0.000001656585 * stature ^ 3) +
  (0.032198263733 * leglenth) - 
  (0.000269025264 * leglenth ^ 2) - 
  (0.000760897942 * age*stature))

}

### Returns time from PHV
# Based on Mirwald et al. (2002). An assessment of maturity from anthropometric
# measurements.
####Male Version
MirwaldMaturityMale <- function(age, bodymass, stature, sittingheight) {
  
  leglenth <- stature - sittingheight
  weight_height_ratio <- (bodymass / stature) * 100
  
  -9.236 + 
    (0.0002708 * (leglenth * sittingheight)) +
    (-0.001663 * (age * leglenth)) +
    (0.007216 * (age * sittingheight)) +
    (0.02293 * weight_height_ratio)
  
}  

####Female Version
MirwaldMaturityFemale <- function(age, bodymass, stature, sittingheight) {
  
  leglenth <- stature - sittingheight
  weight_height_ratio <- (bodymass / stature) * 100
  
  -9.376 + 
    (0.0001882 * (leglenth * sittingheight)) +
    (0.0022 * (age * leglenth)) +
    (0.005841 * (age * sittingheight)) +
    (0.002658 * (age * bodymass)) +
    (0.07693 * weight_height_ratio)
  
}  

###From: Modified Maturity Offset Prediction Equations: Validation in Independent Longitudinal Samples of Boys and Girls (Koziel & Malina, 2018)
###Moore Equation for females
Moore_female <- function(age, stature) {

  -7.709133 +
    (0.0042232 * 
       (age * stature)
     )
  
}

###Moore Equation for males (1)
Moore_male_1 <- function(age, sittingheight) {
  
  -8.8128741 +
    (0.0070346 * 
       (age * sittingheight)
    )
  
}

###Moore Equation for males (2)
Moore_male_2 <- function(age, stature) {
  
  -7.999994 +
    (0.0036124 * 
       (age * stature)
    )
  
}



##Determines if Early/Average/Late maturer.
Maturation_status <- function(age_at_phv){
  
  case_when(age_at_phv < 13 ~ "Early",
            age_at_phv >= 13 & age_at_phv <= 15 ~ "Average",
            age_at_phv > 15 ~ 'Late')
}

