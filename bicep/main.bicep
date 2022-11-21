targetScope = 'subscription'

param StartDate string = utcNow('yyyyMMdd-HHmmss')

param ResourceGroupPrefix string
param Location string


resource vmss 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${ResourceGroupPrefix}-vmss'
  location: Location
}
resource monitor 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${ResourceGroupPrefix}-monitor'
  location: Location
}

