# Det er ikke meningen å kjøre dette scriptet

# En samling av nyttige kommandoer for å deploye ressurser via terraform.
# Kjøres i bash, powershell eller hvor enn du har installert terraform.

# Første gang du skal deploye noe til Azure kjør
terraform init -upgrade

# Etter å ha gjort endringer, men før du deployer kjør
terraform plan -out main.tfplan

# Fiks eventuelle feil/mangler og kjør kommandoen på nytt

# For å deploye kjør
terraform apply main.tfplan

# For å fjerne ressursene kan du enten slette ressursgrupper i Azureportalen
# eller gjøre det via terraform med følgende kommandoer
terraform plan -destroy -out main.destroy.tfplan
terraform apply main.destroy.tfplan 