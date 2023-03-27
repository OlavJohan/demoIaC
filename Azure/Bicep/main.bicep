param location string = resourceGroup().location
param staticWebAppParam object 
param appPlanParam object 
param appServiceParam object 
param env string

var appServiceName = '${appServiceParam.basename}-${env}'
var webappname = '${staticWebAppParam.basename}-${env}'
var appPlanName = '${appPlanParam.basename}-${env}'

resource staticWebApp 'Microsoft.Web/staticSites@2022-03-01' = {
  name: webappname
  location: location
  sku: {
    tier: staticWebAppParam.sku
    name: staticWebAppParam.sku
  }
  properties: {
    allowConfigFileUpdates: true
    branch: staticWebAppParam.branch
    enterpriseGradeCdnStatus: 'Disabled'
    provider: 'GitHub'
    repositoryUrl: staticWebAppParam.repository
    stagingEnvironmentPolicy: 'Enabled'
  }
}

module apiWebApp './appService.bicep' = {
  name: 'api-ressurser'
  params: {
    location: location
    appPlan: appPlanParam
    appPlanName: appPlanName
    appServiceName: appServiceName
  }
}
