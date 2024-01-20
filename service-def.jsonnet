{
  launchType: "FARGATE",
  enableExecuteCommand: true,
  networkConfiguration: {
    awsvpcConfiguration: {
      assignPublicIp: "DISABLED",
      securityGroups: [
        "sg-xxxxxxxxxxxxxxxxx"
      ],
      subnets: [
        "subnet-aaaaaaaaaaaaaaaaa",
        "subnet-bbbbbbbbbbbbbbbbb",
      ],
    }
  },
}
