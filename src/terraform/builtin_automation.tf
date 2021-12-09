#Automation account variables should be encrypted
resource "azurerm_policy_assignment" "automationaccountencryption" {
    name = "auto-accnt-encrypt"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/3657f5a0-770e-44a3-b44e-9431ba1e9735"
    description = "It is important to enable encryption of Automation account variable assets when storing sensitive data"
    display_name = "builtin-automation-account-encryption"
}