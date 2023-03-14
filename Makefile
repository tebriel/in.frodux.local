plan:
	op run --env-file="./.env" -- terraform plan

apply:
	op run --env-file="./.env" -- terraform apply
