# Basic example

Builds the names `acme-iad-prod-app` and `acme-iad-prod-logs` for a production deployment in us-ashburn-1.

```sh
terraform init
terraform apply -var tenancy_id=<tenancy OCID>
```
