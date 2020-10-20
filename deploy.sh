az deployment group create \
  --name ExampleDeployment01 \
  --resource-group Teste \
  --template-file ./arm/azuredeploy.json \
  --parameters ./arm/azuredeploy.parameters.json \
  --rollback-on-error
