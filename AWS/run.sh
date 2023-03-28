cd terraform-aws
terraform apply
endpoint=$(terraform output apigw_endpoint)
bucketname=$(terraform output bucket_name)
websiteurl=$(terraform output website_url)

cd ../react-app
env_file_content="REACT_APP_FYLKESAPI_ENDEPUNKT=$endpoint"
echo $env_file_content > .\.env
npm run build

aws s3 sync build s3://$bucketname --acl public-read
cd ..
echo "Webpage available at $websiteurl"