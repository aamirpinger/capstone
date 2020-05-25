aws cloudformation update-stack \
--stack-name udacity-capstone-project-worker \
--template-body file://worker_node.yml \
--parameters file://node_parameters.json \
--region=us-west-2 \
--capabilities CAPABILITY_IAM