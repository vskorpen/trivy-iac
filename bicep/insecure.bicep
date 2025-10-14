resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'insecurestorage${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    allowBlobPublicAccess: true
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: false
    accessTier: 'Hot'
  }
}
