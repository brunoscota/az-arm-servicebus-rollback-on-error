# az-arm-servicebus-rollback-on-error
description and sample of a service bus rollback on error to successful deployment

# Table of Contents

* [Description](#Description)
    - [Powershell](#Powershell)
    - [Azure CLI](#Azure-CLI)
    - [Sample](#Sample)
* [Todo List](#Todo-List)
* [Work Progress](#Work-Progress)


# Description

When a deployment fails, you can automatically redeploy an earlier, successful deployment from your deployment history. This functionality is useful if you've got a known good state for your infrastructure deployment and want to revert to this state. There are a number of caveats and restrictions:

- The redeployment is run exactly as it was run previously with the same parameters. You can't change the parameters.
- The previous deployment is run using the complete mode. Any resources not included in the previous deployment are deleted, and any resource configurations are set to their previous state. Make sure you fully understand the deployment modes.
The redeployment only affects the resources, any data changes aren't affected.
- You can use this feature only with resource group deployments, not subscription or management group level deployments. For more information about subscription level deployment, see Create resource groups and resources at the subscription level.
- You can only use this option with root level deployments. Deployments from a nested template aren't available for redeployment.

To use this option, your deployments must have unique names so they can be identified in the history. If you don't have unique names, the current failed deployment might overwrite the previously successful deployment in the history.


## PowerShell

To redeploy the last successful deployment, add the `-RollbackToLastDeployment` parameter as a flag.

```azurepowershell-interactive
New-AzResourceGroupDeployment -Name ExampleDeployment02 `
  -ResourceGroupName $resourceGroupName `
  -TemplateFile c:\MyTemplates\azuredeploy.json `
  -RollbackToLastDeployment
```

To redeploy a specific deployment, use the `-RollBackDeploymentName` parameter and provide the name of the deployment. The specified deployment must have succeeded.

```azurepowershell-interactive
New-AzResourceGroupDeployment -Name ExampleDeployment02 `
  -ResourceGroupName $resourceGroupName `
  -TemplateFile c:\MyTemplates\azuredeploy.json `
  -RollBackDeploymentName ExampleDeployment01
```

## Azure CLI

To redeploy the last successful deployment, add the `--rollback-on-error` parameter as a flag.

```azurecli-interactive
az deployment group create \
  --name ExampleDeployment \
  --resource-group ExampleGroup \
  --template-file storage.json \
  --parameters storageAccountType=Standard_GRS \
  --rollback-on-error
```

To redeploy a specific deployment, use the `--rollback-on-error` parameter and provide the name of the deployment. The specified deployment must have succeeded.

```azurecli-interactive
az deployment group create \
  --name ExampleDeployment02 \
  --resource-group ExampleGroup \
  --template-file storage.json \
  --parameters storageAccountType=Standard_GRS \
  --rollback-on-error ExampleDeployment01
```

## Sample.

In this project we have a sample code that uses a servicebus deployed by ARM template. You can execute the deploy.ps1 (powershell code) or deploy.sh (azurecli).

# Work Progress

50%

# Todo List
