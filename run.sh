ECSPRESSO_CONFIG=ecspresso.yaml
RDB_HOST=rdb-cluster.cluster-xxxxxxxxx.ap-northeast-1.rds.amazonaws.com

# --wait-untilで起動するまで待つ
ecspresso run --config $ECSPRESSO_CONFIG --wait-until=running

# 最新のタスクのIDを取得
id=$(
    ecspresso tasks --config $ECSPRESSO_CONFIG --output=json | \
    jq -r '.containers[0].taskArn | split("/")[2]' | head -1 \
)

# ポートフォワードする
ecspresso exec \
  --port-forward \
  --port 3306 \
  --local-port 3306 \
  --config $ECSPRESSO_CONFIG \
  --host $RDB_HOST \
  --id $id
