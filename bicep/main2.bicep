metadata name = 'Trivy template 2'
metadata description = 'Template 2 to verify trivy scans.'
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

module keyVault 'br/public:avm/res/key-vault/vault:0.13.3' = {
  scope: resourceGroup('test-rg')
  params: {
    // Required parameters
    name: 'kv001'
    enableSoftDelete: false
  }
}

module virtualMachine 'br/public:avm/res/compute/virtual-machine:0.20.0' = {
  scope: resourceGroup('test-rg')
  name: 'virtualMachineDeployment'
  params: {
    // Required parameters
    adminUsername: 'localAdminUser'
    adminPassword: 'testToTriggerTrivyæ@123'
    availabilityZone: -1
    imageReference: {
      offer: '0001-com-ubuntu-server-jammy'
      publisher: 'Canonical'
      sku: '22_04-lts-gen2'
      version: 'latest'
    }
    name: 'cvmlinmin'
    nicConfigurations: [
      {
        ipConfigurations: [
          {
            name: 'ipconfig01'
            subnetResourceId: '<subnetResourceId>'
          }
        ]
        nicSuffix: '-nic-01'
      }
    ]
    osDisk: {
      caching: 'ReadWrite'
      diskSizeGB: 128
      managedDisk: {
        storageAccountType: 'Premium_LRS'
      }
    }
    osType: 'Linux'
    vmSize: 'Standard_D2s_v3'
    // Non-required parameters
    disablePasswordAuthentication: false
    location: '<location>'
    publicKeys: [
      {
        keyData: '<keyData>'
        path: '/home/localAdminUser/.ssh/authorized_keys'
      }
    ]
  }
}
