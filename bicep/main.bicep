targetScope = 'subscription'

param StartDate string = utcNow('yyyyMMdd-HHmmss')

param ResourceGroupPrefix string
param Location string


resource vmss 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${ResourceGroupPrefix}-vmss-rg'
  location: Location
}
resource monitor 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${ResourceGroupPrefix}-monitor-rg'
  location: Location
}

module createIdentity 'modules/identity.bicep' = {
 name: '${ResourceGroupPrefix}-identity-${StartDate}'
 scope: vmss
 params: {
  NamePrefix: ResourceGroupPrefix
  Location: Location
 }
}



output StartDate string = StartDate
