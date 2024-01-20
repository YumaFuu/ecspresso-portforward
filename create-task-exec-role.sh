ACCOUNT_ID=xxxxxxxxxxxxxx
TASK_EXEC_ROLE_NAME=ecsBastionTaskExecutionRole

aws iam create-role --role-name $TASK_EXEC_ROLE_NAME --assume-role-policy-document '{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}'

aws iam attach-role-policy --role-name $TASK_EXEC_ROLE_NAME \
  --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy

echo "Done!"
echo "aws:iam::$ACCOUNT_ID:role/$TASK_EXEC_ROLE_NAME"
