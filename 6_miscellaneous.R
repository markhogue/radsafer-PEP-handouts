# A lot to include in this segment: Import a data
# set with shielding results. The data is in a
# spreadsheet.  Select a portion of the data set.
# Obtain the tenth-value-layer - selecting only
# the output columns of interest.  
# 
# *** Import shield_mcnp_results with the Import Dataset
#                  (from Excel) button in Rstudio. ***
# (If trouble, use example data)

# select
df <- shield_mcnp_results[shield_mcnp_results$material ==
    "Pb", ]

# how about a quick, exploratory plot? 
# Use of ggplot2 is beyond the scope of the PEP, so we won't
# get too far into explaining this. For reference, 
# see https://ggplot2.tidyverse.org/reference/index.html
library(ggplot2)
ggplot(shield_mcnp_results, 
       aes(thickness_cm, wb_mrem_h, 
           color = material,
           shape = material)) + 
  geom_point(size = 3, alpha = 0.7) + 
  scale_y_log10()

# all the results
hvl(x = df$thickness_cm, 
    y = df$wb_mrem_h)

# just the first and fifth columns of the result
# table
hvl(x = df$thickness_cm, 
    y = df$wb_mrem_h)[, c(1, 5)]

# half-life estimation 
# 2pt refers to the fact this is estimated between every
# two point, not an overall linear fit.
# half_life_2pt simple example
half_life_2pt(1, 2, 10, 5)

half_life_2pt(0, 4, 20, 5)

# Import half_life_data.xlsx with the Import
# Dataset button in Rstudio.  Back-up - use
# example data

# try using dates - note that date differences
# are by default in days first and second points:
half_life_2pt(time1 = half_life_data$Date[1:2], 
              time2 = half_life_data$Date[2:3],
              N1 = half_life_data$mrem_h[1:2], 
              N2 = half_life_data$mrem_h[2:3]) / 365.25

# all the data:
half_life_2pt(time1 = half_life_data$Date[1:10], 
              time2 = half_life_data$Date[2:11],
              N1 = half_life_data$mrem_h[1:10], 
              N2 = half_life_data$mrem_h[2:11]) / 365.25

# see this in a nice table
data.frame(
         Date = half_life_data$Date[2:11], 
           decay_est_year = half_life_2pt(
             time1 = half_life_data$Date[1:10],
             time2 = half_life_data$Date[2:11], 
             N1 = half_life_data$mrem_h[1:10],
             N2 = half_life_data$mrem_h[2:11]) / 365.25
           )


# stay_time - optional - maybe ask if anyone
# would want to use it
