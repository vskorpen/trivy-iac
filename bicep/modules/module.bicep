targetScope = 'subscription'

// ========== //
// MARK: Parameters
// ========== //
@sys.description('Location where to deploy AVD management plane.')
param location string

// =========== //
//   Modules   //
// =========== //

module vault 'br/public:avm/res/key-vault/vault:0.13.3' = {
  scope: resourceGroup('test-rg')
  params: {
    // Required parameters
    name: 'kvvmin002'
    // Non-required parameters
    enablePurgeProtection: false
  }
}
