library(radsafer)

# Scenario 1.  My check Sr-90 source needs to be
# decay-corrected to today.  Data: Source check
# value (activity, cpm, whatever) was 3010 on
# January 21, 2010.  Note: all radsafer dates are
# in the format '2010-01-21' iow 'YYYY-MM-DD'

# This gives you a correction factor
dk_correct("Sr-90", date1 = "2010-01-21")

# Let's use it with the num option so you can
# multiply it

3010 * dk_correct("Sr-90", 
                  date1 = "2010-01-21", 
                  num = TRUE)

# Note that the warning message is for very
# short-lived radionuclides.  If you're going to
# decay-correct radon decay progeny, you wouldn't
# want to use dates.  Scenario 2.  How much
# Rn-220 decay progeny are left on an air sample
# filter after 24 hours?

RN_info("Pb-212")

# You could find this by going down the chain
# starting with RN_info('Rn-220') or consider Rad
# Toolbox or a paper reference

dk_correct(RN_select = "Pb-212", 
           time_unit = "h", 
           time_lapse = 24)

# Scenario 3.  A Co-60 source was used to
# calibrate an instrument on several dates in the
# past.  It was discovered that the wrong source
# certificate had been used for previous
# decay-corrections.  You want to have on hand
# the right set of numbers to correct the
# records.

dates_used <- c("2018-01-05", "2018-02-08", "2018-07-07")

source_cal_date <- "2016-10-10"

cal_value <- 2046

# compute values for dates used:
new_cal_values <- cal_value * 
  dk_correct(RN_select = "Co-60",
    date1 = source_cal_date, 
    date2 = dates_used, num = TRUE)

new_cal_values


# dk_time example
# ----------------------------------------------------
?dk_time

# We need to identify: the half life the original
# activity the target activity The result will be
# a time with the same unit as the half life
# Example: Carbon dating This is only a part of
# what is needed for carbon dating, but let's try
# it.

A_ref <- 14  # dpm/g originally in wood

A_now <- 3.15

RN_info("C-14")

# Since this function returns a data frame, we can 
# use $ to identify the column name

dk_time(RN_info("C-14")$half_life, 
        A0 = A_ref, 
        A1 = A_now)

# 12266 years old
# 
# Anyone confused by this RN_info("C-14")$half_life structure? 
# You can just copy and paste the value 
dk_time(5700, 
        A0 = A_ref, 
        A1 = A_now)

# How long will it take for some radionuclide to
# decay to a defined percentage?
?dk_pct_to_num_half_life

# example, how many half-lives would it take to
# lose 99% (1% remaining)
dk_pct_to_num_half_life(pct_lost = 99)

# for our C-14 example,
RN_info("C-14")$half_life * 
  dk_pct_to_num_half_life(pct_lost = 99)
# 37869.98 years

