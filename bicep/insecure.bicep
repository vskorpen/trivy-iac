resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'insecurestorage${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    allowBlobPublicAccess: true
    minimumTlsVersion: 'TLS1_0'  // This yields an error, if insecure.bicep is built directly
    supportsHttpsTrafficOnly: false
    accessTier: 'Hot'
  }
}
