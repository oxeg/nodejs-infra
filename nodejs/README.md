# nodejs app

### Running the app

To run the app, use
```
docker-compose up
```

### Q&A
- How would you test this application?
    - For the simple REST endpoint test I would use some JS test frameworks like mocha/jest/supertest.For database connectivity, when it's used in the Node app, I would use Testcontainers, to write more complex integration tests
- How would you deploy this application?
    - Since it's already packed into docker image, it would make sense to deploy it from that image. So far, I wouldn't go with kubernetes, as it seems like overkill, but something simpler, like AWS ECS or AWS Fargate service, that can run workloads from docker image, should be more than enough.Regarding the database, I would use the AWS service that fits best depending on how we're planning to use it. It could be any of RDS or Aurora, as they are Postgres-compatible.Another option would be using Lambda function, in case we want to start small and be more cost-efficient. However, in this case, the deployment would be different from local setup with Docker image, which I would prefer to avoid.
- How would you manage configurations for secrets (ie. the DB password)?
    - Ideal solution would be to use some secret management system, like Valut or AWS Secrets Manager, but again, it might be an overkill in our case.The Simplest and safe enough way would be to use env variables. In case we deploy using ECS, it seems that it's possible to directly inject env variables from Secrets Management.
