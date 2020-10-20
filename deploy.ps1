New-AzResourceGroupDeployment -Name ExampleDeployment01 `
  -ResourceGroupName "Teste" `
  -TemplateFile ./arm/azuredeploy.json `
  -TemplateParameterFile ./arm/azuredeploy.parameters.json `
  -RollbackToLastDeployment
