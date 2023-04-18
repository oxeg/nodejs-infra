# nodejs-infra

### Questions about time limit and what should be improved if given more time.

- Because of the time limit, I tried to cut corners and used terraform modules where I saw fit. But in general, I prefer to have more control over resources that are created. So I would spend some time replacing those modules with raw terraform resources if it gives more control and prevents extra resources from being created. Otherwise I would stay with modules.
- For the Nodejs app I would prefer to have a proper health check endpoint that would show if the database connection works, instead of the hacky way of printing to the console that I used.
- I would dedicate some time to proper AWS IAM user creation, with all the policies in place, password output, etc.
