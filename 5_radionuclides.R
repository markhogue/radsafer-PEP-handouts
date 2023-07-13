
# radionuclides family
# -----------------------------------------------

# Here, we'll draw extensively from the
# accompanying package, RadData We've already
# seen some RN_info examples
RN_find_parent("Po-210")

# find parent
# --------------------------------------------------------

# an option if you're ready for a little
# challenge: nest functions

RN_info(RN_find_parent("Po-210")$RN[1])  #info on the first parent

RN_info(RN_find_parent("Po-210")$RN[2])  #info on the second parent


# Plot a spectrum
# ----------------------------------------------------
?RN_plot_spectrum

# one radionuclide
RN_plot_spectrum(desired_RN = "Eu-154", 
                 photon = TRUE)

# two radionuclides
RN_plot_spectrum(desired_RN = c("Eu-154", "Co-60"),
                 photon = TRUE)

# log y-axis
RN_plot_spectrum(desired_RN = c("Eu-154", "Co-60"),
                 photon = TRUE, 
                 log_plot = 1)

# log both axes
RN_plot_spectrum(desired_RN = c("Eu-154", "Co-60"),
                 photon = TRUE, 
                 log_plot = 2)

# The warning occurs because the geom_segment used has to start somewhere, and it starts at 0, which does not exist on the log plot. (But it works fine anyway.)

# a beta plot
RN_plot_spectrum(desired_RN = c("Sr-90", "Y-90"), 
                 rad_type = "B-",
                 photon = FALSE)

# Save a
# spectrum----------------------------------------------------
Eu_p_spec <- RN_save_spectrum("Eu-154", 
                              photon = TRUE)

# provides tidy data frame with RN, E_MeV, and
# prob - click on the data in the global
# environment to show

# Search spectra - this is particularly important
# for spectroscopists

search_results <- RN_search_phot_by_E(E_min = 0.58,
                                      E_max = 0.585)

# 166 observations try limiting the probability
# Now we'll only get results with > 10%
# probability

search_results <- RN_search_phot_by_E(E_min = 0.58,
                                      E_max = 0.585, 
                                      min_prob = 0.1)
# Now only 6 You can try applying filters based
# on the half-life
search_results <- RN_search_phot_by_E(E_min = 0.58,
                                      E_max = 0.585, 
                                      min_half_life_seconds =
                                        3.153e7)  
# 3.153e7 is about one year
# seven observations

# Do more examples if time. Also alpha, beta Also
# RN_Spec_Act - run examples
