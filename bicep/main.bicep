metadata name = 'Trivy template'
metadata description = 'Template to verify trivy scans.'
metadata author = 'vskorpen'

targetScope = 'subscription'

// ============== //
//   Parameters   //
// ============== //

@description('Required. Some description.')
param parametersymbolicName string

// ============= //
//   Variables   //
// ============= //

var variablesymbolicName = 'someString'

// =========== //
//   Modules   //
// =========== //

module storageAccount 'br/public:avm/res/storage/storage-account:0.27.1' = {
  scope: resourceGroup('test-rg')
  params: {
    // Required parameters
    name: 'ssablob001'
    // Non-required parameters
    kind: 'BlobStorage'
    skuName: 'Standard_LRS'
  }
}
