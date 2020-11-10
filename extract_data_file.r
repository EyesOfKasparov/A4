
string <- "./data/Study2_G2_T1_TurnTaking.csv"

string %>% 
  str_extract("(?<=Study)(\\d)")

string %>% 
  str_extract("(?<=_G)(\\d)")

string %>% 
  str_extract("(?<=_T)(\\d)")