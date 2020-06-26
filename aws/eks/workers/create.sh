aws cloudformation create-stack \
--stack-name udacity-capstone-project-worker \
--template-body file://worker_node.yaml \
--parameters file://node_parameters.json \
--region=us-west-2 \
--capabilities CAPABILITY_IAM

