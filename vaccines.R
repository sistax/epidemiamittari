#Haetaan avoin data koronarokotuksista.

#pakettilataukset
library(tidyr)
library(dplyr)

#Haetaan rokotusdata.
vac_api <- "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv"

#Luetaan CSV-tiedosto R:ään.
vac_raw <- read.csv(vac_api, sep = ",", encoding = "UTF-8") 

rokotedata <- vac_raw |>
  filter(location == 'Finland') |> #Vain Suomen rivit
  
  #Päiväkohtainen rokotettujen määrä ja kokonaismäärä ei kulje synkassa.
  #Täytetään rokotettujen sarakkeeseen tiedot puuttuviin soluihin (edellisen solun tieto).
  #Ei ihan vastaa todellisuutta mutta riittävästi.
  mutate(filled_people_vaccinated = people_vaccinated) |>
  fill(filled_people_vaccinated) |>
  
  #Karsitaan sarakkeita.
  select(date:daily_vaccinations | ends_with("people_vaccinated"))
