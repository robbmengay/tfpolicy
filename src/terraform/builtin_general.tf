#Allowed locations
resource "azurerm_policy_assignment" "allowedlocations" {
    name = "allowed-loc"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"
    description = "This policy enables you to restrict the locations your organization can specify when deploying resources. Use to enforce your geo-compliance requirements. Excludes resource groups, Microsoft.AzureActiveDirectory/b2cDirectories, and resources that use the 'global' region."
    display_name = "builtin-general-allowed-locations"

      parameters = <<PARAMETERS
{
  "listOfAllowedLocations": {
    "value": ["eastus2","centralus"]
  }
}
PARAMETERS
}
#Allowed locations for resource groups
resource "azurerm_policy_assignment" "allowedrglocations" {
    name = "allowed-loc-rgs"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e765b5de-1225-4ba3-bd56-1ac6695af988"
    description = "This policy enables you to restrict the locations your organization can create resource groups in. Use to enforce your geo-compliance requirements."
    display_name = "builtin-general-allowed-loc-rgs"

      parameters = <<PARAMETERS
{
  "listOfAllowedLocations": {
    "value": ["eastus2","centralus"]
  }
}
PARAMETERS
}

#Audit usage of custom RBAC rules
resource "azurerm_policy_assignment" "auditcustomrbac" {
    name = "audit-custom-rbac"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a451c1ef-c6ca-483d-87ed-f49761e3ffb5"
    description =  "Audit built-in roles such as 'Owner, Contributer, Reader' instead of custom RBAC roles, which are error prone. Using custom roles is treated as an exception"
    display_name = "builtin-general-audit-usage-custom-rbac"
}

#Custom subscription owner roles should not exist
resource "azurerm_policy_assignment" "auditownerrole" {
    name = "audit-owner-role"
    scope = var.root_mg_scope
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/10ee2ea2-fb4d-45b8-a7e9-a2e770044cd9"
    description = "This policy ensures that no custom subscription owner roles exist."
    display_name = "builtin-general-sub-owner-not-exist"

}