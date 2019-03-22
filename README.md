## Purestorage Terraform Demo

This project is for a demonstration of the Pure Storage Terraform Provider.
The compute module is faked and just outputs the information that would be needed for storage allocation.

The demo uses variables for the flasharray and api_token to connect to the array.  If the terraform.tfvars file is were to be omitted, then the environment variables `PURE_TARGET` and `PURE_APITOKEN` would be required.
