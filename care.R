#Tässä haetaan sairaalahoitodataa, muokataan sitä Power BI:n käyttöön ja piirretään kartta.

#pakettilataukset
library(tidyr)
library(dplyr)
library(stringr)
library(readr)
library(ggplot2) # Visualisointi
library(pxweb) # Tilastokeskuksen pxweb-rajapinta
library(geofi) # karttapaketti

#Haetaan THL:n avoimesta datasta tiedot sairaalahoidossa olevista COVID-19-potilaista
thl_care <- "https://sampo.thl.fi/pivot/prod/fi/epirapo/covid19care/fact_epirapo_covid19care.csv?row=erva-456367&column=measure-547523.547516.456732.445344.&"
csv_care <- read.csv(thl_care, sep = ";", encoding = "UTF-8") 

#Sarakkeiden tietotyypit
sarakkeet <- cols(Mittari = col_character(),
                  Alue = col_character(),
                  val = col_double()
                  )

#Datan muokkaus
care_data <- csv_care |>
  
  #Tuodaan mittarit riveiltä sarakkeille
  tidyr::pivot_wider(names_from = Mittari, values_from = val) |>

  #Nimetään osa sarakkeista käytännön vuoksi uudelleen
  dplyr::rename(Erikossairaanhoito = 'Käynnissä olevat osastojaksot erikoissairaanhoidon osastoilla',
                Perusterveydenhuolto = 'Käynnissä olevat osastojaksot perusterveydenhuollon osastolla',
                Tehohoitojaksot = 'Käynnissä olevat tehohoitojaksot') |>
  
  #Lasketaan mittaluku: Perusterveydenhuollossa olevat 100 000 asukasta kohden
  mutate(Perusterveys_suhde = Perusterveydenhuolto / (Asukaslukumäärä / 100000))

#Haetaan geofi-paketilla kunnat ja niille erityisvastuualueet.

kunnat <- geofi::get_municipalities()

erityisvastuualueet <- kunnat |>
  group_by(erva_name_fi) |> 
  summarise()

#Muokataan data karttaa varten.
kartta_data <- left_join(erityisvastuualueet, care_data, by = c("erva_name_fi" = "Alue")) |>
  filter(erva_name_fi != "Ahvenanmaa")

#Piirretään kartta.
ggplot(kartta_data,
        aes(fill = Perusterveys_suhde, label = paste0(round(Perusterveys_suhde,2)))) +
        geom_sf(color = alpha("white", 1/3)) +
        theme_minimal() +
        geom_sf_label(size = 3, color = "white") +
        theme(axis.text = element_blank(),
              axis.title = element_blank(),
              panel.grid = element_blank()) +
        labs(fill = "")
