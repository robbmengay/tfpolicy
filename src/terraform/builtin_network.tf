#Network interfaces should not have public Ips
resource "azurerm_policy_assignment" "nopubliciponnics" {
    name = "nic-publicip-policy"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/83a86a26-fd1f-447c-b59d-e51f44264114"
    description = "This policy denies the network interfaces which are configured with any public IP. Public IP addresses allow internet resources to communicate inbound to Azure resources, and Azure resources to communicate outbound to the internet. This should be reviewed by the network security team."
    display_name = "builtin-network-nic-deny-publicip"
}

#RDP access from the Internet should be blocked
resource "azurerm_policy_assignment" "rdpblocked" {
    name = "rdp-blocked-policy"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e372f825-a257-4fb8-9175-797a8a8627d6"
    description = "This policy audits any network security rule that allows RDP access from Internet"
    display_name = "builtin-network-rdp-internet-blocked"
}

#SSH from the Internet should be blocked.
resource "azurerm_policy_assignment" "sshblocked" {
    name = "ssh-blocked-policy"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2c89a2e5-7285-40fe-afe0-ae8654b92fab"
    description = "This policy audits any network security rule that allows SSH access from Internet"
    display_name = "builtin-network-ssh-internet-blocked"
}

#Key Vault should use a virtual network service endpoint
resource "azurerm_policy_assignment" "kvvnetsendpoint" {
    name = "kv-vnet-svcendpnt"
    scope = var.root_mg_scope
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/ea4d6841-2173-4317-9747-ff522a45120f"
    description = "This policy audits any Key Vault not configured to use a virtual network service endpoint."
    display_name =  "builtin-network-kv-use-service-endpoint"
}