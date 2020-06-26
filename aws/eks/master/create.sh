aws cloudformation create-stack \
--stack-name udacity-capstone-project-eks \
--template-body file://master.yaml \
--parameters file://master_parameters.json \
--region=us-west-2