# mcnp tools
# --------------------------------------------------------
# not to be confused with MCNP
# (registered trademark)'s MCNP tools.
# These are some helpful functions for
# MCNP analysts, but also, if you're
# not an MCNP analyst, we'll hit the
# most helpful for everyone first.
# 
# Quick plot of MCNP source
# 
# *** Open in a text editor the output file 
#         mcnp_output.o 
# find probability distribution 1 for source variable erg, 
# It's on line 218
# Copy the distribution - without the headers
mcnp_scan2plot("my input energy spectrum")



# *** open mcnp_output_2.o ***
# find probability distribution 1 for source
# variable erg, line 218
mcnp_scan2plot("my other input energy spectrum")

# This one will be boo-boo. Need log
# options
mcnp_scan2plot("my other input energy spectrum",
    log_plot = 2)

# skip down to 2222 or search for 1ta
mcnp_scan2plot("my output energy spectrum",
    log_plot = 2)

# Let's say you wanted to save the data
# instead
my_out_spec <- mcnp_scan_save()

# click on my_out_spec in the
# Environment pane to show data and
# column titles.  Use this data and
# plot with ...
mcnp_plot_out_spec(my_out_spec, 
                   "tally 14 saved",
                   log_plot = 2)

# As you learn R, you can find all
# kinds of other ways to plot, for
# example
library(ggplot2)
ggplot(my_out_spec, aes(E_MeV, prob)) + 
  geom_point(color = "magenta",
             size = 2, 
             shape = 2, 
             stroke = 2) + 
  theme(plot.title = element_text(color = "goldenrod4",
                                  size = 14, 
                                  face = "bold.italic"), 
        axis.title.x = element_text(color = "goldenrod4",
                                    size = 14, 
                                    face = "bold"), 
        axis.title.y = element_text(color = "goldenrod4",
                                    size = 14, 
                                    face = "bold"), 
        panel.background = element_rect(fill = "yellow3",
                                        colour = "grey50")) + 
  labs(title = "example with ggplot")

# interactive chart - just a demo 
#    (need to have r package plotly installed)
library(plotly)
ggplotly(ggplot(my_out_spec, aes(E_MeV, prob)) +
    geom_point(color = "magenta", 
               size = 2,
               shape = 2,
               stroke = 2) + 
    theme(plot.title = element_text(color = "goldenrod4",
              size = 14, 
              face = "bold.italic"), 
          axis.title.x = element_text(color = "goldenrod4",
              size = 14, 
              face = "bold"), 
          axis.title.y = element_text(color = "goldenrod4",
              size = 14, 
              face = "bold"), 
          panel.background = element_rect(fill = "yellow3",
              colour = "grey50")) + 
      labs(title = "example with ggplot"))


# While we're here, let's 
# *** skip down to the tally fluctuation table ***
# (all the way at the bottom) 
# Let's set a target of 1% error (0.01) 
# and see how many particles we need to run

mcnp_est_nps(0.01)

# Now something to help with translations (trcl)
# matrix rotations This is straight
# from the help examples section
mcnp_matrix_rotations("x", 30)

mcnp_matrix_rotations("z", 15)

# For combined rotations, use matrix
# multiplication (%*%) rotate 45
# degrees on x-axis and 45 degrees on
# y-axis radsafer version 2.2.8 changed
# the output of this from a matrix
# (requiring edit after pasting into
# MCNP input) to an unformatted list of
# numbers. This broke the ability to do
# a straightforward matrix
# multiplication.  Below is a simple
# fix.  Should I change it? Maybe just
# change the example.

matrix(mcnp_matrix_rotations("x", 30), ncol = 3,
    byrow = TRUE) %*% 
  matrix(mcnp_matrix_rotations("z",
    15), ncol = 3, byrow = TRUE)

# Explanation, %*% is the matrix multiplication operator
?`%*%`

# (you have to copy and paste, deleting
# the row labels)

# Make an input distribution from
# isotopic data
mcnp_sdef_erg_line("Eu-154", 
                   photon = TRUE,
                   write_permit = "y")  
# send output to a file in your default directory

# Make an input distribution from
# Origen data Open Origen_out
# spreadsheet
mcnp_sdef_erg_hist()  # follow directions in Console

# and, thank you!
