# Script for deploy via powershell

# Før du kjører scriptet må du ha en Azure bruker med en Azure subscription (f.eks. studentbruker)
# og installere 'Powershell az module'
# Kjør kommandoen 'az login' før du kjører scriptet (trengs bare å gjøres en gang hvis du skal kjøre scriptet flere ganger).

# rg for 'resource group'. Sjekk ut microsoft sin navnekonvensjon for forkortelser
# https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations
$resourceGroup = "rg-ifidemo-bicep"

# Endre denne til en subscription i din Azure-konto
$azureSubscription = "Visual Studio Enterprise Subscription"

# Nærmeste datasenter er norwayeast, men static web app er ikke støttet der dessverre
# Bytt evt. til andre datasentre, du finner gyldige valg på nettet. 
$location = "westeurope"

$bicepfile = "./main.bicep"
$paramsfile = "./params.json"


az account set --name $azureSubscription
az group create --name $resourceGroup --location $location

az deployment group create `
    --template-file $bicepfile `
    --parameters $paramsfile `
    --resource-group $resourceGroup