param NamePrefix string
param Location string = resourceGroup().location

resource mgdId 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' = {
  name: '${NamePrefix}-uaid'
  location: Location
}

output mgdId string = mgdId.id
