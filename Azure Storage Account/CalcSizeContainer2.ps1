CONTAINER_NAME=""
STORAGE_ACCOUNT_NAME=""
STORAGE_ACCOUNT_NAME_KEY=""

$container = $CONTAINER_NAME
$con = 'DefaultEndpointsProtocol=https;AccountName=$STORAGE_ACCOUNT_NAME;AccountKey=$STORAGE_ACCOUNT_KEY'
 
$ret = az storage blob list `
    --container-name $container --query "[*].[properties.contentLength]" `
    --connection-string $con `
    --output table 
 
$total = 0
 
foreach ($item in ($ret | Select-Object -skip 2)){
    $total += [math]::Round($item / 1GB, 2)
} 
 
Write-Host $total
