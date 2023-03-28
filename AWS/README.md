# Terraform med AWS

Dette eksempelet demonstrerer hvordan man kan deploye et liten web-applikasjon med tilhørende API til AWS.

Eksempelet krevet at du har terraform installert, og har en AWS bruker.

For å sette opp alt kan du kjøre `run.ps1` i Windows, eller utføre enkeltkommandoene hver for seg på et Unix-basert system som beskrevet under.
OBS: Før du kjører scriptet må du gå til `react-app` og kjøre kommandoen `npm install`

## Steg for å kjøre eksempelet

1. Legg til AWS_ACCESS_KEY_ID og AWS_SECRET_ACCESS_KEY som miljøvariabler i terminalen.
    - Disse kan du få tak i fra bruker-dropdown > Security Credentials i AWS konsollen
    - Dersom du ikke har en AWS bruker, kan du opprette en gratis.
2. Gå inn i `terraform-aws` mappen og kjør kommandoen `terraform init`
3. Kjør kommandoen `terraform apply`
4. Kopier API gateway endpoint URLen som kommer fra forrige output til [react-app/.env](react-app/.env)
5. Gå til `react-app` mappen og kjør kommandoene `npm install` og `npm run build`
    - Dette krever at du har npm installert
6. Kopier innholdet i `build` mappen (ikke selve mappen) til S3 bucketen du laget med terraform.
    - Dette kan enten gjøres med å drag-and-droppe i AWS konsollen, eller å kjøre kommandoen `aws s3 sync build s3://<bucket-navn> --acl public-read` hvor du bytter ut `<bucket-navn>` med navnet på din bucket. For å kjøre kommandoen trenger du aws sitt CLI installert.
7. Gå inn på nettsiden som ble laget for deg og sjekk om det fungerer! Du finner nettside-URLen ved å gå i `terraform-aws` mappen og kjøre kommandoen `terraform output website_url`.
7. Når du er ferdig, gå til `terraform-aws` mappen og kjør kommandoen `terraform destroy` for å slette ressursene du har satt opp.
