#Allowed virtual machine size SKUs
resource "azurerm_policy_assignment" "allowedvmskus" {
    name = "allowed-vm-skus"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/cccc23c7-8427-4f53-ad12-b6a63eb452b3"
    description = "The list of size SKUs that can be specified for virtual machines."
    display_name = "builtin-compute-allowed-vm-skus"

      parameters = <<PARAMETERS
{
  "listOfAllowedSKUs": {
    "value": ["Standard_D1_v2","Standard_DS12_v2","Standard_E16-4s_v3","Standard_D32_v3","Standard_D2_v2","Standard_DS13-2_v2","Standard_E16-8s_v3","Standard_DS1_v2","Standard_D3_v2","Standard_DS13-4_v2","Standard_E16s_v3","Standard_DS2_v2","Standard_D4_v2","Standard_DS13_v2","Standard_E20s_v3","Standard_DS3_v2","Standard_D5_v2","Standard_DS14-4_v2","Standard_E32-8s_v3","Standard_DS4_v2","Standard_D11_v2","Standard_DS14-8_v2","Standard_E32-16s_v3","Standard_DS5_v2","Standard_D12_v2","Standard_DS14_v2","Standard_E32s_v3","Standard_DS11-1_v2","Standard_D13_v2","Standard_F1s","Standard_E48s_v3","Standard_DS11_v2","Standard_D14_v2","Standard_F2s","Standard_E64-16s_v3","Standard_DS12-1_v2","Standard_D15_v2","Standard_F4s","Standard_E64-32s_v3","Standard_DS12-2_v2","Standard_F1","Standard_F8s","Standard_E64is_v3","Standard_E32_v3","Standard_F2","Standard_F16s","Standard_E64s_v3","Standard_E48_v3","Standard_F4","Standard_D48_v3","Standard_DS15_v2","Standard_E64i_v3","Standard_F8","Standard_D64_v3","Standard_D1","Standard_E64_v3","Standard_F16","Standard_D2s_v3","Standard_D2","Standard_E2s_v3","Standard_A1_v2","Standard_D4s_v3","Standard_D3","Standard_E4-2s_v3","Standard_A2m_v2","Standard_D8s_v3","Standard_D4","Standard_E4s_v3","Standard_A2_v2","Standard_D16s_v3","Standard_D11","Standard_E8-2s_v3","Standard_A4m_v2","Standard_D32s_v3","Standard_D12","Standard_E8-4s_v3","Standard_A4_v2","Standard_D48s_v3","Standard_D13","Standard_E8s_v3","Standard_A8m_v2","Standard_D64s_v3","Standard_D14","Standard_DS12","Standard_A8_v2","Standard_E2_v3","Standard_DS1","Standard_DS13","Standard_D2_v3","Standard_E4_v3","Standard_DS2","Standard_DS14","Standard_D4_v3","Standard_E8_v3","Standard_DS3","Standard_F2s_v2","Standard_D8_v3","Standard_E16_v3","Standard_DS4","Standard_F4s_v2","Standard_D16_v3","Standard_E20_v3","Standard_DS11","Standard_F8s_v2","Standard_F64s_v2","Standard_F48s_v2","Standard_F32s_v2","Standard_F16s_v2"]
  }
}
PARAMETERS
}

#Audit virtual machines without disaster recovery configured (Production)
resource "azurerm_policy_assignment" "auditvmdrconfig" {
    name = "audit-vm-dr-config"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0015ea4d-51ff-4ce3-8d8c-f3f8f0179a56"
    description = "Audit virtual machines which do not have disaster recovery configured"
    display_name = "builtin-compute-audit-vm-without-dr"
}