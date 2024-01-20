profile="your-profile"
config="ecspresso.yaml"
cluster="your-cluster"
family="bastion"
host="some-rds-cluster.cluster-xxxxxxxxxxxx.ap-northeast-1.rds.amazonaws.com"

AWS_PROFILE=$profile \
  ecspresso run --config $config \
  --no-wait

id=$(AWS_PROFILE=$profile aws ecs list-tasks \
    --cluster $cluster --family $family \
    --query taskArns[0] --output text | cut -d'/' -f3 \
  )
echo id: $id

echo Wait until task running..
AWS_PROFILE=$profile \
  aws ecs wait tasks-running \
  --cluster $cluster \
  --tasks $id

AWS_PROFILE=$profile ecspresso exec \
  --port-forward \
  --port 3306 \
  --local-port 3306 \
  --config $config \
  --host $host \
  --id $id
