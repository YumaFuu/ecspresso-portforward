{
  family: "bastion",
  cpu: "256",
  memory: "512",
  executionRoleArn: "arn:aws:iam::xxxxxxxxxxxx:role/ecsBastionTaskExecutionRole",
  taskRoleArn: "arn:aws:iam::xxxxxxxxxxxx:role/ecsBastionTaskRole",
  networkMode: "awsvpc",
  containerDefinitions: [
    {
      name: "bastion",
      image: "yumafuu/sleepy",
      command: ["600"],
    }
  ],
}
