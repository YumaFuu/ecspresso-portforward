# ecspresso-portforward

ecspressoを使ってFargateを起動してportforwardするサンプルコード

[ecspresso](https://github.com/kayac/ecspresso)

Taskで起動するイメージはsleepだけできればいいので次のイメージを使います
[yumafuu/sleepy](https://github.com/YumaFuu/docker-sleepy)

## IamRole

以下のActionを許可したRoleをTaskRoleとしてアタッチする必要があります
```
ssmmessages:CreateControlChannel
ssmmessages:CreateDataChannel
ssmmessages:OpenControlChannel
ssmmessages:OpenDataChannel
```

実行ロールは特になんのアクションも必要ありません

### 作成

```bash
$ bash create-task-role.sh
$ bash create-task-exec-role.sh
```

## 起動方法

```bash
$ bash run.sh
```
# ecspresso-portforward
