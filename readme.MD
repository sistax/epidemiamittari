# COVID-19 pandemian seurantaraportti

Simple overview of use/purpose.

## Raportin tavoitteet

* Hyödyntää **avoimia datalähteitä**
* Käyttäjä pystyy tarkastelemaan kattavasti dataan pohjautuen COVID-19 tapauksiin liittyviä trendejä sekä rokotustilanteen edistymistä
* Käyttäjä saa tilastollista analyysia rokotusten vaikutuksesta COVID-19 tapauksiin ja tähän pohjautuvaa ennustetta trendien kehityssuunnasta lähikuukausille.
* Raportti päivittyy automaattisesti päivätasolla

# Raportin toteutus

1. Data haettiin THL:n avoimesta datasta ja muokattiin PowerBI:tä R:llä.
>> IDE-työkaluna käytettiin RStudiota.
>> Datan perusmuokkaus tehtiin R:llä, Power BI:ssä voitiin siirtyä suoraan visualisoinnin toteutukseen.

2. Data tuotiin PowerBI:n käyttöön R-komentosarjana. 
>> Käytettävä data on [main.R -skriptin](main.R) tuottama **thldata**-elementti.

3. Visualisoinnit toteutettiin Power BI:llä
>> Datan sarakkeiden tietotyyppi muutettiin kokonaisluvuiksi (pl. Aika-sarake), jota varten tekstisolut muunnettiin puuttuviksi arvoiksi.
