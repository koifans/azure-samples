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
Write-Host "Selecting subscription '$subscriptionId'";
Select-AzureRmSubscription -SubscriptionID $subscriptionId;

$RgName="Rg-Simple-VM"
New-AzureRmResourceGroup -Name $RgName -Location "China North"

# Start the deployment
Write-Host "Starting deployment...";
New-AzureRmResourceGroupDeployment -ResourceGroupName $RgName -TemplateFile azuredeploy.json
