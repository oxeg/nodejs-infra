# infra

### Q&A

- What type of security concerns do you have around the VPC?
    - The biggest concern I had for the suggested VPC setup, is that we're creating staging and production services under the same AWS account. I would split those into 2 separate accounts, just to be safe that some staging admin user (if there is one) can't possibly break anything in production.
    - Also, I would carefully set up what connections are allowed to/from both of these VPCs using security groups. The ones I created are pretty much a template for further setup.

- What questions do you have about the 2 users that have full admin access?
    - Of course, it requires some justifications, why these users need full Admin access to all the resources in both prod/stage environments. But in general, there's nothing wrong with having few admin users.
    - The requirements on how to attach the AdministratorAccess policy to these users were not very clear. I would prefer to avoid attaching it directly to users, but doing it via an assumable role wasn't forbidden, and it's safer, more flexible and in general a more preferred way.

- What security precautions would you take for system users vs. human users?
    - For human users I would require 2FA enabled + give them as few permissions as possible. All extra permissions that might be needed for them, I would provide via some assumable roles with limited session time. I would also set up a password policy for the AWS accounts (length, complexity, expiration time). Some user activity monitoring would also be nice. If users require access keys, I would set up an access key rotation policy.
    - For system users, again, I would use roles instead of users where possible. And grant as few permissions as possible to those users/roles. It would also make sense to use resource based policies.
