# Steps:

1. Add AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY as environment variables.
    - Get these from under the user dropdown > Security Credentials in the AWS Console
    - If you do not have an AWS user, create a user for free.
2. `terraform init`
3. `terraform apply`
4. Copy the API gateway endpoint url and paste it in [react-app/.env](react-app/.env)
5. Run `npm run build` in the react-app folder
6. Copy the build folder contents to the created S3 bucket `website-bucket`
7. When you are done, run `terraform destroy` in the terraform-aws folder.
