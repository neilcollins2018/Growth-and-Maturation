# Growth-and-Maturation

## Currently 2 scripts: 

  * Equations for assessment of maturity
  * How to use maturation data to predict adult stature using reference tables by Sherar et al
  
### Equations/Functions for maturity include:

  * Function which returns when date of birth and test date available (can deal with messy date format)
  * Franson et al (2017) Maturity Ratio (Male only)
  * Mirwald et al (2002) Maturity Assessment (Male and Female)
  * Koziel & Malina (2018) Moore Maturity offset (2 Male versions and single female)
  * Function which returns maturation status (Early/Average/Late) based off age at PHV
  
 ### Sherar et al (2005) script:
  
  * Includes sample data to run analyses
  * Male and female reference tables in script (If using regularly, save as external `.csv` and import when needed)
  * Analyses performed using `data.table` package and rolling joins
  
