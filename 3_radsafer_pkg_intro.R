# Introduction to the radsafer
# package---------------------------------
?radsafer
# Getting help on a function (package::function
# option)
?radsafer::air_dens_cf

# This is useful if you don't have the package loaded:
?beepr::beep

?beep #does not work if we haven't loaded beepr

# run examples in help window click index at
# bottom of air_dens_cf help window click User
# guides, package vignettes and other
# documentation.  open vignette HTML click Show
# in New Window Symbol Note in vignette - related
# functions - we'll work through some functions
# from each family


# Example arguments
# -------------------------------------------------
# decay corrections
?dk_correct

# This is a workhorse function with many options
# for use.  Look at all options listed and note
# that they are not all used at the same time.
# If you select the radionuclide, you do not need
# half_life or time_unit.  If you select
# time_lapse, you do not need date1 and date2.
# If you want to decay to the present date, you
# can leave date2 blank.  If you use this
# function to get a number to do more
# calculations with, set num = TRUE!  run some
# examples in next script

