# Basic Keycloak Deployment using docker-compose

Use this repo in order to kickstart a local or "production ready" keycloak instance.

- Note: This repo stores sensitive info inside config files. There are better ways to secure sensitive information. You are free to fork this repo and make the appropriate changes.

- Note: This repo uses JonasAlfredsson's `docker-nginx-certbot` repo to automatically create and renew website SSL certificates using the Let's Encrypt. See the appropriate repo for more information.

- Note: This repo was created to be used by me... I will not provide further intructions or support. Fork the repo, study it and make any appropriate changes you seem appropriate for your case.

## Instructions

### Deploy Locally

Run `run-local.sh` 
```
./run_local.sh
```
Optionally you may provide a -d parameter to the script `./run_local.sh -d` to detach the service from the terminal window.


### Deploy in production

1. Change values inside app.conf, keycloak.env, postgres-backup.env, postgresd.env, nginx-certbot.env.

2. Run `deploy-prod.sh`
```
./deploy-prod.sh
```

Optionally you may provide a -d parameter to the script `./deploy-prod.sh -d` to detach the service from the terminal window.
