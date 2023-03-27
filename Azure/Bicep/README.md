## Deploy
- Installer bicep og az
- Ha/lag en bruker og en subscription i Azure (f.eks. studentbruker)
- $ `az login`
- kjør `deploy.sh` eller `deploy.ps1`

## Deploy din egen kode
### Slik det er satt opp nå (litt klønete)
I `staticWebAppParam` i `params.json` refereres det til et git-repository. Hvis du ønsker å  deploye kode på denne måten må du referere til et repo du selv har kontroll over (e.g forke repoet som det er referert til). Etter koden er deployet, legg til en workflow under `.github/workflows`. I Azure-portalen på static web app ressursen står det filnavnet på filen den leter etter `azure-static-web-apps-<morsomme-ord>-<randomtegn>.yml`. Kall workflowen nøyaktig dette, og kopier innholdet fra en annen workflow. I azure-portalen på static web app ressurser, se 'manage deployment token'. Legg til en secret i githuben din med tokenet, og kall den det samme som det refereres til i workflowen. 

### Undersøk muligheten for å gjøre forslaget over via kode
Jada, jeg skulle egentlig gjort dette i forkant.

### Host git-repoet i Azure devops i stedet for GitHub
Gjør du dette kan du bygge din egen IaC-pipeline med et innebygd verktøy som forenkler prosessen. Du trenger ikke å styre med tokens.
