#=============================================================================
# Tidyverse and data wrangling - dplyr: Operations on rows

library(dplyr)
library(nycflights13)

# FILTERING --------------------------------------------------------------------

# 1. Extract the flights which departed between 10 and 16 June 2013.

# === -> YOUR CODE ===
flights %>%
  filter(year == 2013, month == 6, between(day, 10, 16))
# === <- YOUR CODE ===

# 2. Extract only the data for the UA carrier and do not include a distance of
# > 1000miles

# === -> YOUR CODE ===
flights %>%
  filter(carrier == "UA",
         !(distance >1000))
# === <- YOUR CODE ===


# 4. Extract only the data for the UA carrier only for the 6th month and calculate
# the average distance travelled

# === -> YOUR CODE ===
flights %>%
  filter(carrier == "UA",
         month == 6) %>% 
  summarise(average_distance = mean(distance, na.rm = T))
  
# === <- YOUR CODE ===

# COUNT ------------------------------------------------------------------------

# 2. How many flights departed from each of the origin airports? Sort in
# descending order.

# === -> YOUR CODE ===
flights %>%
  count(origin, sort = TRUE)
# === <- YOUR CODE ===

# 3. How many flights departed from each of the origin airports broken down by month?

# === -> YOUR CODE ===
flights %>%
  count(origin, month)
# === <- YOUR CODE ===

# ARRANGE -----------------------------------------------------------------------

# 4. Using flights find which carriers are associated with the top 5 departure
# delays. dep_delay carrier
#      1301 HA
#      1137 MQ
#      1126 MQ
#      1014 AA
#      1005 MQ

# === -> YOUR CODE ===
flights %>%
  arrange(desc(dep_delay)) %>%
  select(dep_delay, carrier)
# === <- YOUR CODE ===


# DISTINCT ----------------------------------------------------------------

# 5. How many unique airlines are there in the data?

# === -> YOUR CODE ===
flights %>%
  distinct(carrier)
# === <- YOUR CODE ===

Making some changes to this script