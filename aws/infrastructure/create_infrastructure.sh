aws cloudformation create-stack \
--stack-name udacity-capstone-project \
--template-body file://infrastructure.yml \
--parameters file://infrastructure-params.json \
--region=us-west-2 \
--capabilities CAPABILITY_IAM