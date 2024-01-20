ACCOUNT_ID=xxxxxxxxxxxxxx
TASK_ROLE_NAME=ecsBastionTaskRole
POLICY_NAME=ecsBastionTaskPolicy

aws iam create-role --role-name $TASK_ROLE_NAME --assume-role-policy-document '{
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

aws iam create-policy --policy-name $POLICY_NAME --policy-document '{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowObjectAccess",
      "Effect": "Allow",
      "Action": [
        "ssmmessages:CreateControlChannel",
        "ssmmessages:CreateDataChannel",
        "ssmmessages:OpenControlChannel",
        "ssmmessages:OpenDataChannel",
      ],
      "Resource": "*"
    }
  ]
}'

aws iam attach-role-policy --role-name $TASK_ROLE_NAME --policy-arn "arn:aws:iam::$ACCOUNT_ID:policy/$POLICY_NAME"

echo "Done!"
echo "aws:iam::$ACCOUNT_ID:role/$TASK_ROLE_NAME"
