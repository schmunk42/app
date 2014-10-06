Deploy
===========

Platform as a Service (Paas)
--------------------------------------

Most Paas providers will expect your environment configuration to be based on environment variables.

To enable this, you need to make sure that your buildpack executes the following during the build/compile stage:

```
./init --env="Environment configuration based on environment variables"
```

This will activate a application configuration that uses [php-app-config](https://github.com/neam/php-app-config). Read it's readme to understand how it works and how you can use it locally as well as in PaaS deployments. At the very least read the instructions under "Platform as a Service" to understand what config is necessary to set for your PaaS app/deployment.

For troubleshooting, activate environment configuration based on environment variables locally in your Phundament 4 app:

```
cp config/local/secrets.dist.php config/local/secrets.php
./init --env="Environment configuration based on environment variables"
```
