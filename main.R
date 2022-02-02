#Tässä haetaan data ja muokataan se PowerBI:n käyttöön.
#Pyritään pärjäämään suht pienellä määrällä paketteja (base R:llä).

#pakettilataukset
library(tidyr)
library(dplyr)
library(stringr)                         

#Haetaan THL:n tartuntatautirekisteristä koronatapausten, testausten ja kuolemantapausten viikkotasoinen data.
thl_api <- "https://sampo.thl.fi/pivot/prod/fi/epirapo/covid19case/fact_epirapo_covid19case.csv?row=dateweek20200101-509030&column=measure-444833.445356.492118.&&fo=1"

#Luetaan CSV-tiedosto R:ään.
#pakettiversiona toimisi esim. readr::read_csv2(thl_api)
csv_raw <- read.csv(thl_api, sep = ";", encoding = "UTF-8") 

#Muokataan dataa
thldata <- csv_raw |> #Natiivi pipe-operaattori, vrt. tidyverse-paketin %>%
  
  #Tuodaan mittarit riveiltä sarakkeille
  tidyr::pivot_wider(names_from = Mittari, values_from = val) |> 
  
  #Nimetään sarakkeet käytännön vuoksi uudelleen
  dplyr::rename(Tapaukset = 'Tapausten lukumäärä',
         Testaukset = 'Testausmäärä',
         Kuolemat = 'Kuolemantapausten lukumäärä') |>
  
  #Korvataan puuttuvat arvot nollilla
  tidyr::replace_na(list(Testaukset = 0, Kuolemat = 0)) |>
  
  #Jaetaan Aika-sarake viikkosarakkeeseen ja vuosisarakkeeseen
  dplyr::mutate(Viikko = str_sub(Aika,-2,-1),
                Vuosi = str_sub(Aika,7, 10)) 
  
  
  