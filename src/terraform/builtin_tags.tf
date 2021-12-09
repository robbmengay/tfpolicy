#Require a tag and its value on resource groups
resource "azurerm_policy_assignment" "requiretagonrgenv" {
    name = "req-rg-tags-env"
    scope = var.root_mg_scope
    not_scopes = var.exclusions
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/96670d01-0a4d-4649-9c89-2d3abc0a5025"
    description = "Enforces existence of a tag on resource groups."
    display_name = "builtin-tags-require-resourcegroups-environment"
    parameters = <<PARAMETERS
{
    "tagName": {
        "value": "Environment"
    }
}
PARAMETERS
}

#Require a tag and its value on resource groups
resource "azurerm_policy_assignment" "requiretagonrgdataclass" {
    name = "req-rg-tags-classif"
    scope = var.root_mg_scope
    not_scopes = var.exclusions
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/96670d01-0a4d-4649-9c89-2d3abc0a5025"
    description = "Enforces existence of a tag. Does not apply to resource groups."
    display_name = "builtin-tags-require-resourcegroups-data-classification"
    parameters = <<PARAMETERS
{
    "tagName": {
        "value": "DataClassification"
    }
}
PARAMETERS
}

#Require a tag and its value on resource groups
resource "azurerm_policy_assignment" "requiretagonrgrole" {
    name = "req-rg-tags-role"
    scope = var.root_mg_scope
    not_scopes = var.exclusions
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/96670d01-0a4d-4649-9c89-2d3abc0a5025"
    description = "Enforces existence of a tag. Does not apply to resource groups."
    display_name = "builtin-tags-require-resourcegroups-role"
    parameters = <<PARAMETERS
{
    "tagName": {
        "value": "Role"
    }
}
PARAMETERS
}

#Require a tag and its value on resource groups
resource "azurerm_policy_assignment" "requiretagonrgsg" {
    name = "req-rg-tags-support-grp"
    scope = var.root_mg_scope
    not_scopes = var.exclusions
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/96670d01-0a4d-4649-9c89-2d3abc0a5025"
    description = "Enforces existence of a tag. Does not apply to resource groups."
    display_name = "builtin-tags-require-resourcegroups-support-group"
    parameters = <<PARAMETERS
{
    "tagName": {
        "value": "SupportGroup"
    }
}
PARAMETERS
}

#Require a tag and its value on resource groups
resource "azurerm_policy_assignment" "requiretagonrgappid" {
    name = "req-rg-tags-appid"
    scope = var.root_mg_scope
    not_scopes = var.exclusions
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/96670d01-0a4d-4649-9c89-2d3abc0a5025"
    description = "Enforces existence of a tag. Does not apply to resource groups."
    display_name = "builtin-tags-require-resourcegroups-appid"
    parameters = <<PARAMETERS
{
    "tagName": {
        "value": "AppID"
    }
}
PARAMETERS
}
############################## Below Code for Resources #######################

#Require a tag and its value on resources
resource "azurerm_policy_assignment" "requiretagonresenv" {
    name = "req-res-tags-env"
    scope = var.root_mg_scope
    not_scopes = var.exclusions
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/871b6d14-10aa-478d-b590-94f262ecfa99"
    description = "Enforces existence of a tag. Does not apply to resource groups."
    display_name = "builtin-tags-require-resources-environment"
    parameters = <<PARAMETERS
{
    "tagName": {
        "value": "Environment"
    }
}
PARAMETERS
}

#Require a tag and its value on resources
resource "azurerm_policy_assignment" "requiretagonresdataclass" {
    name = "req-res-tags-classif"
    scope = var.root_mg_scope
    not_scopes = var.exclusions
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/871b6d14-10aa-478d-b590-94f262ecfa99"
    description = "Enforces existence of a tag. Does not apply to resource groups."
    display_name = "builtin-tags-require-resources-data-classification"
    parameters = <<PARAMETERS
{
    "tagName": {
        "value": "DataClassification"
    }
}
PARAMETERS
}

#Require a tag and its value on resources
resource "azurerm_policy_assignment" "requiretagonresrole" {
    name = "req-res-tags-role"
    scope = var.root_mg_scope
    not_scopes = var.exclusions
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/871b6d14-10aa-478d-b590-94f262ecfa99"
    description = "Enforces existence of a tag on resources."
    display_name = "builtin-tags-require-resources-role"
    parameters = <<PARAMETERS
{
    "tagName": {
        "value": "Role"
    }
}
PARAMETERS
}

#Require a tag and its value on resources
resource "azurerm_policy_assignment" "requiretagonressg" {
    name = "req-res-tags-support-grp"
    scope = var.root_mg_scope
    not_scopes = var.exclusions
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/871b6d14-10aa-478d-b590-94f262ecfa99"
    description = "Enforces existence of a tag on resources."
    display_name = "builtin-tags-require-resources-support-group"
    parameters = <<PARAMETERS
{
    "tagName": {
        "value": "SupportGroup"
    }
}
PARAMETERS
}

#Require a tag and its value on resources
resource "azurerm_policy_assignment" "requiretagonresappid" {
    name = "req-res-tags-appid"
    scope = var.root_mg_scope
    not_scopes = var.exclusions
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/871b6d14-10aa-478d-b590-94f262ecfa99"
    description = "Enforces existence of a tag on resources."
    display_name = "builtin-tags-require-resources-appid"
    parameters = <<PARAMETERS
{
    "tagName": {
        "value": "AppID"
    }
}
PARAMETERS
}