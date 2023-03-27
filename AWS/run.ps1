Set-Location terraform-aws
terraform apply
$Endpoint=terraform output apigw_endpoint
$BucketName=terraform output bucket_name
$WebsiteUrl=terraform output website_url

Set-Location ../react-app
$EnvFileContent = "REACT_APP_FYLKESAPI_ENDEPUNKT=$Endpoint"
$EnvFileContent | Out-File .\.env -Encoding utf8
npm run build

aws s3 sync build s3://$BucketName --acl public-read
Set-Location ..
Write-Output "Webpage available at ${WebsiteUrl}"