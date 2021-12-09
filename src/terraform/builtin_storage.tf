#Secure transfer to storage accounts should be enabled
resource "azurerm_policy_assignment" "sasecuretransfer" {
    name = "secure-sa-transfer"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/404c3081-a854-4457-ae30-26a93ef643f9"
    description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
    display_name = "builtin-storage-secure-transfer"
}


##Geo-redundant storage should be enabled for storage accounts##
resource "azurerm_policy_assignment" "georeduntant" {
    name = "geo-redundant-storage"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/bf045164-79ba-4215-8f95-f8048dc1780b"
    description = "Use geo-redundancy to create highly available applications"
    display_name = "builtin-storage-geo-redundant-enabled"

}

##Storage accounts should restrict network access##
resource "azurerm_policy_assignment" "stgrestrictnetaccess" {
    name = "stg-restrict-net-access"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/34c877ad-507e-4c82-993e-3452a6e0ad3c"
    description = "Network access to storage accounts should be restricted. Configure network rules so only applications from allowed networks can access the storage account."
    display_name = "builtin-storage-restrict-net-access"

}

##Allowed storage account SKUs##
resource "azurerm_policy_assignment" "allowedstgskus" {
    name = "stg-allowed-skus"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7433c107-6db4-4ad1-b57a-a76dce0154a1"
    description = "Restrict the set of storage account SKUs that your organization can deploy."
    display_name = "builtin-storage-limited-by-sku"
      parameters = <<PARAMETERS
{
  "listOfAllowedSKUs": {
    "value": ["Standard_LRS","Standard_GRS","Standard_ZRS","Standard_GZRS","Standard_RAGRS","Standard_RAGZRS","Standard_ZRS"]
  }
}
PARAMETERS
}