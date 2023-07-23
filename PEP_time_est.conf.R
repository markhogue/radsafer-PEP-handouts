# Schedule to keep us on track for the two-hour PEP
# stop times for each segment will be based on seven R-scripts.
#
duration_est <- c(20, # intro, include PPT slides
                  10, # functions
                  5,  # package intro
                  20, # decay_corrections
                  20, # radionuclides,
                  10, # miscellaneous
                  15, # rad measurements
                  20) # mcnp tools
segments <- c("intro",
              "functions",
              "package_intro",
              "decay_corrections",
               "radionuclides",
              "miscellaneous",
               "rad_measurements",
               "mcnp_tools")
sum(duration_est) #120 minutes - no time to spare - all times are max to allow some breaks

start_time <- 12 # actually starts at 12:15.. adjusted below
df <- data.frame("segment" = segments,
                 "presenter" = c(rep("Mark", 4), rep("Adam", 3), "Mark"),
                 "segment_min" = duration_est,
                 "running_min" = cumsum(duration_est))
time_min_comp <- as.character(15 + df$running_min - df$running_min %/% 60 * 60)
time_min_comp[time_min_comp == "0"] <- "00"
df$time <- paste0(start_time + 
                  df$running_min %/% 60, ":", 
                  time_min_comp)

df
# segment                  segment_time    running.time
# 1             intro           20           20
# 2         functions           10           30
# 3     package_intro            5           35
# 4 decay_corrections           20           55
# 5     radionuclides           20           75
# 6     miscellaneous           10           85
# 7  rad_measurements           15          100
# 8        mcnp_tools           20          120

library(flextable)
ft <- flextable(df)
ft
