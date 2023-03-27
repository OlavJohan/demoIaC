param location string = resourceGroup().location
param kind string = 'linux'
param appPlan object 
param appPlanName string 
param appServiceName string


resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appPlanName
  location: location
  kind: kind
  properties: {
    reserved: true
  }
  sku: {
    name: appPlan.sku.name
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  location: location
  name: appServiceName
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
