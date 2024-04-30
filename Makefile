plan-dev:
	terraform plan -var-file=environments/dev.tfvars -out plan.tfplan

refresh-dev:
	terraform refresh -var-file=environments/dev.tfvars