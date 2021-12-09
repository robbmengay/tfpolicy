#Require encryption on Data Lake Store accounts
resource "azurerm_policy_assignment" "datalakeaccountencryption" {
    name = "adls-accnt-encrypt"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a7ff3161-0087-490a-9ad9-ad6217f4f43a"
    description = "This policy ensures encryption is enabled on all Data Lake Store accounts"
    display_name = "builtin-datalake-account-encryption"
}

#Diagnostic logs in Azure Data Lake Store should be enabled
resource "azurerm_policy_assignment" "datalakediaglogs" {
    name = "adls-diag-logs"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/057ef27e-665e-4328-8ea3-04b3122bd9fb"
    description = "Audit enabling of Data Lake resource logs. This enables you to recreate activity trails to use for investigation purposes"
    display_name = "builtin-datalake-resource-logs-enabled"

}

#Diagnostic logs in Data Lake Analytics should be enabled
resource "azurerm_policy_assignment" "datalakeanalyticsdiaglogs" {
    name = "adls-analytics-diag-logs"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c95c74d9-38fe-4f0d-af86-0c7d626a315c"
    description = "Audit enabling of Data Lake Analytics resource logs. This enables you to recreate activity trails to use for investigation purposes"
    display_name = "builtin-datalake-analytics-logs-enabled"

}