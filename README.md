# ecspresso-portforward


[ecspresso](https://github.com/kayac/ecspresso) を使ってFargateを起動してportforwardするサンプルコード

Taskで起動するイメージはsleepだけできればいいので [yumafuu/sleepy](https://github.com/YumaFuu/docker-sleepy) を使います

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
