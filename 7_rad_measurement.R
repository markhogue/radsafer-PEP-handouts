# A couple easy ones for
# warm-up-------------------------------------
# Correct a vented ion chamber reading At
# calibration, a vented ion chamber is either
# corrected to standard conditions.

# Let's say the reading is 4.9 mR/h, but we're
# outside at a shipping container and a storm is
# rolling in. Pressure is 723 mm Hg.  Temperature
# is 15 C correct as follows
?air_dens_cf

4.9 * air_dens_cf(T.actual = 15, 
                  P.actual = 723, 
                  T.ref = 20,
                  P.ref = 760)

# On contact reading of a small neutron source
# (e.g. Cf-252) with a standard size NRD Because
# the solid angle becomes unusually high in this
# situation, ISO 8529-2-2000 calls for a
# correction factor Using the ISO equation, we
# correct an 11 cm NRD with a small source:
neutron_geom_cf(11.1, 11)

# This is the correction for the dose rate at 11
# cm (not on contact)

# Speaking of solid angle issues, here's how to
# deal with a common situation, where you have
# calibrated a scaler with one size source and
# are counting something else. For example, air
# sample filter sizes vary, smear sizes vary,
# etc.  You need to know the source radius, the
# item being counted radius, the gap from the
# source to the detector, the detector radius.
# Use same units for everything.  The correction
# of one item to another is a ratio of the solid
# angles.  Example: our source's active radius is
# 20 mm our air sample activity is distributed
# evenly with a radius of 22.5 mm the gap is 20
# mm the detector radius is 12.5 mm both source
# and sample are assumed to be on-center First,
# play around with the plot options
disk_to_disk_solid_angle(r.source = 20, 
                         gap = 20, 
                         r.detector = 12.5,
                         plot.opt = "3d")

# Try it with off-center 5 mm
disk_to_disk_solid_angle(r.source = 20, 
                         gap = 20, 
                         r.detector = 12.5,
                         plot.opt = "3d", 
                         off_center = 5, 
                         runs = 1e+05)


# The correction factor we're looking for will be
# the ratio of the source solid angle (the solid
# angle with our calibration source) to the
# sample solid angle (the solid angle with the
# filter or swipe or whatever we're measuring).
# We could do this all at once, or we can compute
# the relative solid angles and save them, then
# divide them later

source_solid <- disk_to_disk_solid_angle(20, 20, 12.5)

sample_solid <- disk_to_disk_solid_angle(22.5, 20,
    12.5)

# We need to identify that we want the first [1]
# number.  The second is to get the Monte Carlo
# standard deviation.

source_solid[1]/sample_solid[1]

# (as.numeric drops the column name)

as.numeric(source_solid[1]/sample_solid[1])

# This makes sense; larger items being counted
# will have fewer hits on the detector, so
# correction factor should be > 1.

# Scaler
# simulation-------------------------------------------------
# Treat this as a thought experiment.  We think
# we know the background and what the true sample
# is.
scaler_sim(true_bkg = 50, 
           true_samp = 20, 
           ct_time = 3)

# load a picture of a ratemeter with the
# incrememnt below ---> this is only going to
# work if you put in the right directory. So, do
# this: Go to top line in Rstudio and click
# Session then Set Working Directory then To
# Source File Location

# rate meter simulation
# ---------------------------------------------------

# Switch to power point to show image of rate
# meter

# Rate meter simulation can help us estimate
# uncertainty in reading a rate meter. Our
# default uses a time constant...
rate_meter_sim(cpm_equilibrium = 250, 
               meter_scale_increments = seq(100, 1000, 20))

# Hit the Zoom button to show better
# Interpretation: 95% coverage between 200 and
# 300 for a mean of 250?

rate_meter_sim(cpm_equilibrium = 250, 
               meter_scale_increments = seq(100, 1000, 20), 
               log_opt = "y")

# easier to read number of lines if we skip some
rate_meter_sim(cpm_equilibrium = 250, 
               meter_scale_increments = seq(100,1000, 100),
               log_opt = "y")

# Interpretation: after coming to equilibrium,
# looks like ~95% between 200 and 300.

# Time permitting: estimate the time constant
?tau_estimate

tau_estimate(pct_eq = 90, t_eq = 20)

# use this new tau in the simulation
rate_meter_sim(cpm_equilibrium = 250, 
               meter_scale_increments = seq(100, 1000, 100),
               log_opt = "y", 
               tau = 8.69)

