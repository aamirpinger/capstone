aws cloudformation update-stack \
--stack-name udacity-capstone-project-eks \
--template-body file://master.yml \
--parameters file://master_parameters.json \
--region=us-west-2