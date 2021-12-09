#------------------------------------------------#
# azure-terraform-statefile-storage-account.ps1
# author: matthew.clark@avanade.com
#
# Verifies storage account and container used to store the TFSTATE file in Azure. If the Storage Account does not exist, it will be created.
#
# Params:
#   ResourceGroupName
#       The name of the resource Group
#       Required: Yes
#       Alias: rg
#   Location
#       The location/region your resources will be deployed
#       Required: Yes
#       Alias: l
#   Storage Account Name
#       The name of the storage account. Must follow Azure requirements. This script does not verify the name before attempting to create.
#       Required: yes
#       Alias: sa
#   Container Name
#       The name of the container to store the TFSTATE file.
#       Required: yes
#       Alias: c
# Example: 
#   ./azure-terrafor-statefile-storage.ps1 -rg example -l eastus -sa examplestorageaccount -c examplecontainername
#
#   Azure CLI command will output details on errors
#------------------------------------------------#
[CmdletBinding()]
param(
    [Parameter(mandatory=$true)]
    [Alias("rg")] 
    [string] $ResourceGroupName,
    [Parameter(mandatory=$true)]
    [Alias("l")]
    [string] $Location,
    [Parameter(mandatory=$true)]
    [Alias("sa")]
    [string] $StorageAccountName,
    [Parameter(mandatory=$true)]
    [Alias("c")]
    [string] $ContainerName,
    [Parameter(mandatory=$true)]
    [Alias("sid")]
    [string] $SubscriptionID    
)

Write-Host "$(Get-Date -Format "yyyy-MM-dd | HH:mm:ss") | INFO | Checking Resource Group: $($ResourceGroupName)"
Write-Host "This is the subscription variable: $($SubscriptionID)"



if(! (az group show --name $ResourceGroupName --subscription $SubscriptionID)) {
    Write-Host "$(Get-Date -Format "yyyy-MM-dd | HH:mm:ss") | INFO | Creating Resource Group: $($ResourceGroupName)"
    az group create --location $Location --name $ResourceGroupName --output none --subscription $SubscriptionID
    if(!$?) {
        throw "Failed Creating Resource Group"
    }
}
Write-Host "$(Get-Date -Format "yyyy-MM-dd | HH:mm:ss") | INFO | Done..."

Write-Host "$(Get-Date -Format "yyyy-MM-dd | HH:mm:ss") | INFO | Checking Storage Account: $($StorageAccountName)"
if(! (az storage account show --name $StorageAccountName --resource-group $ResourceGroupName --subscription $SubscriptionID)) {
    Write-Host "$(Get-Date -Format "yyyy-MM-dd | HH:mm:ss") | INFO | Creating Storage Account: $($StorageAccountName)"
    Write-Host "$(Get-Date -Format "yyyy-MM-dd | HH:mm:ss") | INFO |                   Region: $($Location)"
    Write-Host "$(Get-Date -Format "yyyy-MM-dd | HH:mm:ss") | INFO |                      sku: Standard_LRS"
    az storage account create --name $StorageAccountName --resource-group $ResourceGroupName --location $Location --sku Standard_LRS --output none --subscription $SubscriptionID
    if(!$?) {
        throw "Failed Creating Storage Account"
    }
}
Write-Host "$(Get-Date -Format "yyyy-MM-dd | HH:mm:ss") | INFO | Done..."

Write-Host "$(Get-Date -Format "yyyy-MM-dd | HH:mm:ss") | INFO | Checking Container: $($ContainerName)"
$key = $(az storage account keys list --resource-group $ResourceGroupName --subscription $SubscriptionID --account-name $StorageAccountName --query [0].value -o json)
if(! (az storage container show --name $containerName --subscription $SubscriptionID --account-name $StorageAccountName --account-key $key)) {
    Write-Host "$(Get-Date -Format "yyyy-MM-dd | HH:mm:ss") | INFO | Creating Container: $($ContainerName)"
    az storage container create --name $containerName --account-name $StorageAccountName --subscription $SubscriptionID --account-key $key --output none
    if(!$?) {
        throw "Failed Creating Container"
    }
}
Write-Host "$(Get-Date -Format "yyyy-MM-dd | HH:mm:ss") | INFO | Done..."


