
library(tidyverse)
library(lubridate)

eid1 <- read_csv('Data/Raw/eid-1995-2010.csv')
eid2 <- read_csv('Data/Raw/eid-2011-2025.csv')

eid <- bind_rows(eid1, eid2)
table(is.na(eid$DOI))
View(eid %>% filter(is.na(DOI)))

eid %>%
  mutate(Date = ymd(`Create Date`)) %>% 
  arrange(desc(Date)) %>% 
  select(DOI, `Publication Year`, Title) -> eid

demo <- read_csv('Data/Raw/eid-demo.csv')

eid %>%
  left_join(demo) -> eid

write_csv(eid, 'Data/Clean/eid-template.csv', na = '')
