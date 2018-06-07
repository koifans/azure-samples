<#
 .SYNOPSIS
    Deploys a template to Azure

 .DESCRIPTION
    Deploys an Azure Resource Manager template

 .PARAMETER subscriptionId
    The subscription id where the template will be deployed.

 .PARAMETER resourceGroupName
    The resource group where the template will be deployed. Can be the name of an existing or a new resource group.

 .PARAMETER resourceGroupLocation
    Optional, a resource group location. If specified, will try to create a new resource group in this location. If not specified, assumes resource group is existing.

 .PARAMETER deploymentName
    The deployment name.

 .PARAMETER templateFilePath
    Optional, path to the template file. Defaults to template.json.

 .PARAMETER parametersFilePath
    Optional, path to the parameters file. Defaults to parameters.json. If file is not found, will prompt for parameter values based on template.
#>

#******************************************************************************
# Script body
# Execution begins here
#******************************************************************************

# sign in
Write-Host "Logging in...";
Login-AzureRmAccount -EnvironmentName AzureChinaCloud

# select subscription
$subscriptionName="Visual Studio Enterprise"
Write-Host "Selecting subscription '$subscriptionName'";
Get-AzureRmSubscription -Verbose
Select-AzureRmSubscription -SubscriptionName $subscriptionName;

$RgName="Rg-Simple-VM"
New-AzureRmResourceGroup -Name $RgName -Location "China North"

# Start the deployment
Write-Host "Starting deployment...";
New-AzureRmResourceGroupDeployment -ResourceGroupName $RgName -TemplateFile azuredeploy.json -storageNamePrefix storesecure -Debug

#Remove-AzureRmResourceGroup -Name $RgName