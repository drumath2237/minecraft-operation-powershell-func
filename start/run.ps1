using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

$resouceGroupName = $env:ResourceGroupName
$resourceName = $env:ResourceName

Connect-AzAccount # -Identity

# Write to the Azure Functions log stream.
Write-Host $resourceName

Start-AzVM -ResourceGroupName $resouceGroupName -Name $resourceName
# Stop-AzVM -ResourceGroupName $resouceGroupName -Name $resourceName -Force

# Interact with query parameters or the body of the request.

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
})
