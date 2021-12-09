#Resource logs in Key Vault should be enabled 
resource "azurerm_policy_assignment" "resourcelogsforkvenabled" {
    name = "kv-logs-enabled"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/cf820ca0-f99e-4f3e-84fb-66e913812d21"
    description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes when a security incident occurs or when your network is compromised"
    display_name = "builtin-keyvault-logs-enabled"
}

#Key vaults should have soft delete enabled
resource "azurerm_policy_assignment" "keyvaultsoftdelete" {
    name = "kv-softdel-enabled"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d"
    description = "Deleting a key vault without soft delete enabled permanently deletes all secrets, keys, and certificates stored in the key vault. Accidental deletion of a key vault can lead to permanent data loss."
    display_name =  "builtin-keyvault-soft-del-enabled"

}

