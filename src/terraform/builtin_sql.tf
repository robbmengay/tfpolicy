#Auditing on SQL server should be enabled
resource "azurerm_policy_assignment" "auditsqlserver" {
    name = "audit-sql-server"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a6fb4358-5bf4-4ad7-ba82-2cd2f41ce5e9"
    description = "Auditing on your SQL Server should be enabled to track database activities across all databases on the server and save them in an audit log."
    display_name = "builtin-sql-auditing-enabled"
}

##Vulnerability assessment should be enabled on your SQL servers##
resource "azurerm_policy_assignment" "sqlvulnerability" {
    name = "assess-sql-vulnerability"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/ef2a8f2a-b3d9-49cd-a8a8-9a3aaaf647d9"
    description = "Audit Azure SQL servers which do not have recurring vulnerability assessment scans enabled. Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities."
    display_name = "builtin-sql-vul-assessment-enabled"
}

##SQL servers should be configured with auditing retention days greater than 90 days.##
resource "azurerm_policy_assignment" "sqlretentionaudit" {
    name = "sql-retention-audit"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/89099bee-89e0-4b26-a5f4-165451757743"
    description = "We recommend setting the data retention for your SQL Server' auditing to storage account destination to at least 90 days."
    display_name = "builtin-sql-auditing-90-day-retention"
}

##An Azure Active Directory administrator should be provisioned for SQL servers##
resource "azurerm_policy_assignment" "sqladadmin" {
    name = "adadmin-sql-provisioned"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1f314764-cb73-4fc9-b863-8eca98ac36e9"
    description = "Audit provisioning of an Azure Active Directory administrator for your SQL server to enable Azure AD authentication."
    display_name = "builtin-sql-azure-ad-admin-provisioned"
}
