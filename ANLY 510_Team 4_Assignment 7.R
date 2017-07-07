library(zoo)
library(dplyr)

dirty <- read.csv('dirty_data.csv', header = TRUE, stringsAsFactors = FALSE, na.strings=c("","NA"))

# Question 1: Fill the missing value - Forward Fill Method
dirty$Area <- na.locf(dirty$Area)

# Question 2: Remove all special charaters and empty spaces. 

dirty$Street <- dirty$Street %>% 
                  gsub(pattern = "[^a-zA-Z0-9]", replacement = ' ') %>% 
                    gsub(pattern = "\\s+", replacement = ' ') %>%
                      trimws() %>%
                        gsub(pattern = 'Street', replacement = 'St') %>%
                          gsub(pattern = 'street', replacement = 'St') %>%
                            gsub(pattern = 'Avenue', replacement = 'Ave') %>%
                              gsub(pattern = 'avenue', replacement = 'Ave')
dirty$Street.2 <- dirty$Street.2 %>% 
                    gsub(pattern = "[^a-zA-Z0-9]", replacement = ' ') %>% 
                      gsub(pattern = "\\s+", replacement = ' ') %>%
                        trimws() %>%
                          gsub(pattern = 'Street', replacement = 'St') %>%
                            gsub(pattern = 'street', replacement = 'St') %>%
                              gsub(pattern = 'Avenue', replacement = 'Ave') %>%
                                gsub(pattern = 'avenue', replacement = 'Ave')

# Question 3: Remove duplicate column Street.2
dirty[dirty$Street == dirty$Street.2, 'Street.2'] <- ' '

# Question 4: Remove last column
dirty <- dirty[-5]


#dirty$Street <- gsub('[^a-zA-Z0-9]',' ',dirty$Street)
#dirty$Street <- gsub("\\s+"," ",dirty$Street)
#dirty$Street.2 <- gsub('[^a-zA-Z0-9]',' ',dirty$Street.2)
#dirty$Street.2 <- gsub("\\s+"," ",dirty$Street.2)


