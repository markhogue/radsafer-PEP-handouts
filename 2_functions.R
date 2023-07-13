# In this segment:
#    Make functions less terrifying


# Make a function
# ----------------------------------------------------
# simple toy function to add one to an argument
# Argument name is a Define the function
add_one <- function(a) a + 1

# Run the function In this example, we don't have
# to name the argument since we follow the order
# of the arguments - easy to do when there's only
# one argument
add_one(5)

# can always name the argument to be sure
add_one(a = 3)

# two arguments
subtract_something <- function(a, b) a - b

# in order
subtract_something(5, 3)

# note - use = in arguments (not <-)
subtract_something(a = 5, b = 3)

# you can do this - order is not important if you
# identify 'arguments':
subtract_something(b = 3, a = 5)

# but look out for this:
subtract_something(3, 5)  #arguments are accepted in the defined order, or specified.


# multiple items as
# once!-------------------------------------------
subtract_something(a = c(3, 4, 5), b = 5)

subtract_something(a = 3, b = c(3, 4, 5))


# both arguments multiple, same number of
# them----------------------
subtract_something(a = c(0, 1, 2), b = c(6, 5, 4))  #matched arguments


# mismatched
# arguments---------------------------------------------
# R does not know what to do!
subtract_something(a = c(0, 1, 2), b = c(4, 5))

# unmatched, but multiple - cycles through to
# match
subtract_something(a = c(0, 1, 2, 3), b = c(4, 5))

# Function format - longer functions - use {}
# --------------------- let's see an example from
# radsafer first, load the package

# Important - need to do this to get the rest of
# the session to work
library(radsafer)
# typing a function without () - shows code for
# the function
air_dens_cf
