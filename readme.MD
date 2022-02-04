# COVID-19 pandemian seurantaraportti

**[Power BI -raportti](https://app.powerbi.com/view?r=eyJrIjoiNGE4N2Y0YWQtNDA0My00NjljLWI4MjQtMTY5NTJiYmE5MmFhIiwidCI6ImZiZDJmMDQ1LWIzNGMtNDY3My05NTM0LThmMjM3NDM1NWNlYyIsImMiOjh9&pageName=ReportSection58fe988a37b420d0b0e7)**

## Raportin tavoitteet

* Hyödyntää **avoimia datalähteitä**
* Käyttäjä pystyy tarkastelemaan kattavasti dataan pohjautuen COVID-19 tapauksiin liittyviä trendejä sekä rokotustilanteen edistymistä
* Käyttäjä saa tilastollista analyysia rokotusten vaikutuksesta COVID-19 tapauksiin ja tähän pohjautuvaa ennustetta trendien kehityssuunnasta lähikuukausille.
* Raportti päivittyy automaattisesti päivätasolla

## Raportin toteutus

1. Data haettiin <a href="https://thl.fi/fi/" target="_blank">THL:n</a> ja  <a href="https://ourworldindata.org/" target="_blank">Our Wolrd in Datan</a> avoimesta datasta.

2. Data tuotiin Power BI:n käyttöön R-komentosarjana tai suoraan avoimen datan verkko-osoitteesta.
>> R:n data on oltava data frame -muodossa, jollainen on esimerkiksi [main.R -skriptin](main.R) tuottama **thldata**-elementti.

3. Joiltain osin data muokattiin Power BI:tä varten R:llä
>> IDE-työkaluna käytettiin RStudiota.
>> Datan perusmuokkaus tehtiin R:llä, Power BI:ssä voitiin siirtyä suoraan visualisoinnin toteutukseen.

4. Muilta osin dataa muokattiin Power BI:ssä ilman R:ää
>> Rokoteraportin dataan yhdistettiin THL:n ja Our World in Datan avointa dataa.
>> ***Koronarokotteen saaneet*** ja ***Täyden rokotussarjan saaneet*** -tietoja varten puuttuvien solujen tiedot korvattiin edeltävän solun tiedolla, koska THL:n datassa kumulatiivinen päiväkohtainen rokotusten saaneiden määrä ja rokotuksen saaneiden määrä yhteensä ei jostain syystä tuoneet samaa tietoa (asiaa tutkittu [care.R-skriptissä](care.R)).

5. Visualisoinnit toteutettiin ja raportti julkaistiin Power BI:llä
>> Power BI:hin yritettiin tuoda myös R:n visualisointi (ks. [care.R](care.R)), mutta visualisointia ei saatu kunnolla toimimaan.
