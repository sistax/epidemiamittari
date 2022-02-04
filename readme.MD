# COVID-19 pandemian seurantaraportti

**[Power BI -raportti](https://app.powerbi.com/view?r=eyJrIjoiNGE4N2Y0YWQtNDA0My00NjljLWI4MjQtMTY5NTJiYmE5MmFhIiwidCI6ImZiZDJmMDQ1LWIzNGMtNDY3My05NTM0LThmMjM3NDM1NWNlYyIsImMiOjh9&pageName=ReportSection58fe988a37b420d0b0e7)**

## Raportin tavoitteet

* Hyödyntää **avoimia datalähteitä**
* Käyttäjä pystyy tarkastelemaan kattavasti dataan pohjautuen COVID-19 tapauksiin liittyviä trendejä sekä rokotustilanteen edistymistä
* Käyttäjä saa tilastollista analyysia rokotusten vaikutuksesta COVID-19 tapauksiin ja tähän pohjautuvaa ennustetta trendien kehityssuunnasta lähikuukausille.
* Raportti päivittyy automaattisesti päivätasolla

## Raportin toteutus

1. Data haettiin [THL:n](https://thl.fi/fi/) ja [Our Wolrd in Datan](https://ourworldindata.org/) avoimesta datasta

2. Data tuotiin Power BI:n käyttöön R-komentosarjana tai suoraan avoimen datan verkko-osoitteesta.
>* R:n data on oltava data frame -muodossa, jollainen on esimerkiksi [main.R -skriptin](main.R) tuottama **thldata**-elementti.

3. Joiltain osin data muokattiin Power BI:tä varten R:llä
>* IDE-työkaluna käytettiin RStudiota.
>* Datan perusmuokkaus tehtiin R:llä, Power BI:ssä voitiin siirtyä suoraan visualisoinnin toteutukseen.

4. Muilta osin dataa muokattiin Power BI:ssä ilman R:ää
>* Rokoteraportin dataan yhdistettiin THL:n ja Our World in Datan avointa dataa.
>* ***Koronarokotteen saaneet*** ja ***Täyden rokotussarjan saaneet*** -tietoja varten puuttuvien solujen tiedot korvattiin edeltävän solun tiedolla, koska THL:n datassa kumulatiivinen päiväkohtainen rokotusten saaneiden määrä ja rokotuksen saaneiden määrä yhteensä ei jostain syystä tuoneet samaa tietoa (asiaa tutkittu [care.R-skriptissä](care.R)).

5. Visualisoinnit toteutettiin ja raportti julkaistiin Power BI:llä
>* Power BI:hin yritettiin tuoda myös R:n karttavisualisointi (ks. [care.R](care.R) ja [karttakuva](https://raw.githubusercontent.com/sistax/epidemiamittari/main/care_kartta.png)), mutta visualisointia ei saatu kunnolla toimimaan.
