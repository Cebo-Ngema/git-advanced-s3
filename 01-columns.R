#=============================================================================
# Tidyverse and data wrangling - Operations on columns

library(dplyr)
library(palmerpenguins)

# SELECTING --------------------------------------------------------------------

# 1. Select the following columns from the penguins:
#    - species
#    - island and
#    - bill_length_mm
# Hint: There are a few ways to do this!

penguins
# === -> YOUR CODE ===
penguins_sub <- penguins %>%
  select(species, island, bill_length_mm)

penguins_subset <- penguins %>%
  select(species:bill_length_mm)
# === <- YOUR CODE ===

# ARRANGING --------------------------------------------------------------------

# 2. Find the simplest way to arrange columns from iris in the following order:
#    - Species
#    - Sepal.Length
#    - Sepal.Width
#    - Petal.Length and
#    - Petal.Width
iris 
# === -> YOUR CODE ===
iris_all <- iris %>%
  select(Species, everything())
# === <- YOUR CODE ===

# RENAMING ---------------------------------------------------------------------

# 3. Transform the built in mtcars data so that it looks like this (select and
# rename columns)

#                     displacement weight
# Mazda RX4                  160.0  2.620
# Mazda RX4 Wag              160.0  2.875
# Datsun 710                 108.0  2.320
# Hornet 4 Drive             258.0  3.215
# Hornet Sportabout          360.0  3.440
# Valiant                    225.0  3.460
# Duster 360                 360.0  3.570

mtcars
# === -> YOUR CODE ===
mt_sub <- mtcars %>%
  select(displacement = disp, weight = wt)
# === <- YOUR CODE ===

# REMOVING COLUMNS -------------------------------------------------------------

# 4. Revise the penguins data set as follows:
# - drop the columns sex and year;
# - move the island column to the first position.
# - perform these operations in one call to select()

# === -> YOUR CODE ===
penguins_revised <- penguins %>%
  select(island, everything(), -year, -sex)
# === <- YOUR CODE ===

# MUTATING ---------------------------------------------------------------------

# 5. Add flipper_length_ratio column to the penguins data, where each ratio is the
# quotient of flipper_length over body_mass

# === -> YOUR CODE ===
penguins_ratio <- penguins %>%
  mutate(flipper_length_ratio = flipper_length_mm / body_mass_g)
# === <- YOUR CODE ===

# 6. Replace the wt column in mtcars with a mass column (in units of kg).

# === -> YOUR CODE ===
mtcars_edit <- mtcars %>%
  mutate(mass = wt * 1000 / 2.205)
# === <- YOUR CODE ===

# 7. Replace mutate() with transmute() to isolate your transformed mass column

# === -> YOUR CODE ===
car_mass <- mtcars %>%
  transmute(mass = wt * 1000 / 2.205)
# === <- YOUR CODE ===