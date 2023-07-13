# In this segment:
#   Show Rstudio features
#   Use R as a calculator

# *** Navigate around Rstudio - use Tools / Global Options / Pane Layout, 
# then, / Appearance
# then, / Packages


# first - type in the Console then also run in
# the Source panel (Run button or ctrl-enter)

# addition
3 + 4

# multiplication
5 * 7


# logarithms
# ----------------------------------------------------------
# plain old log is base e

log(2)

# log based 10 function is log10
log10(10000)


# exponents
# ----------------------------------------------------------

# base 2
2^10

# base e
exp(-log(2) * 10/5.27)


# make a set of numbers
# ---------------------------------------------------
# use alt-dash to make assignment operator

my_nums <- c(1, 3, 5, 9)

# Three things to notice here: 1. We made an
# 'object' and called it my_nums An object name
# is case-sensitive Objects cannot start with a
# number, but can be just about anything else 2.
# The assignment operator <- is preferred 3. the
# c() function 'combines' values into a 'vector'
# 
# Simple use of help function:
?c

# Two other ways to generate vectors:
my_other_nums <- 1:10

# Help on the : -- to look up operators like this, put the 
# item you're looking up in back ticks (top left on the keyboard)
?`:`

# Third way to make a set of numbers
my_rep_nums <- rep(33, 10)

# clear up the global environment -
rm(my_nums, my_rep_nums)

# Also, can use the broom symbol in the
# Environment window

# show all objects
ls()
# remove all the objects
rm(list = ls())

