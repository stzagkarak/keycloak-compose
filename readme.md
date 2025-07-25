# Basic Keycloak Deployment using docker-compose

Use this repo in order to kickstart a local or "production ready" keycloak instance.

- Note: This repo stores sensitive info as plaintext inside config files. You are free to fork this repo and make appropriate changes to sensitive information.

- Note: This repo uses JonasAlfredsson's `docker-nginx-certbot` repo to automatically create and renew website SSL certificates using the Let's Encrypt. See the appropriate repo for more information.

- Note: This repo was created to be used by me... I will not provide further intructions or support. Fork the repo, study it and make any appropriate changes you seem appropriate for your case.

## Instructions

> Tested on fedora v42. Package versions bellow:

```bash
dnf list --installed | grep "docker"
```

```bash
containerd.io.x86_64            1.7.27-3.1.fc42     docker-ce-stable
docker-buildx.x86_64            0.25.0-1.fc42       updates
docker-cli.x86_64               28.3.2-1.fc42       updates
docker-compose.x86_64           2.38.2-1.fc42       updates
docker-compose-switch.x86_64    1.0.5-2.fc42        fedora
```

> May need to modify scripts and docker compose files for your system.

### Deploy Locally

1. Study and possibly change configuration files ( also check for hidden ones like that start with "." like ".env" ).

2. Run `run-local.sh`. Requires docker and docker compose to be available in cli.

```bash
./run_local.sh
```

Optionally you may provide a `-d` parameter to the script `./run_local.sh -d` to detach the service from the terminal window.

The script spins up a keycloak server on `http://localhost:8080`. The default admin username and password is "admin_changeme".

### Deploy in production

Prerequisites:

- Aquire and setup a domain to your server.

#### Initialize the nginx proxy with SSL certificates for you domain.

1. Study and CHANGE values in the configuration files ( also check for hidden ones like that start with "." like ".env" ).

2. `cd` into the `setup-nginx` folder and run `./run_setup.sh`.
3. Wait till the process has been complited ( check the logs ).
4. Run `docker compose down`. If no errors, `./../instance/nginx/` should contain the nessesary files for SSL encryption to be supported for your domain.

#### Run Keycloak in Production

1. Study and CHANGE values in the configuration files ( also check for hidden ones like that start with "." like ".env" ).

2. `cd` into `deployment`. Run `docker compose up`. If all goes well, you may use "CTRL+C" to exit and stop the containers, then run `docker compose down` followed by `docker compose up -d` to re-run in detached mode.

The appoach followed spins up a keycloak server with a postgres database for data storage. The postgres database is backedup daily using `prodrigestivill/postgres-backup-local`. You can find the backups on the `database-backups` docker volume.

The keycloak server "sits" behind a nginx reverse proxy. The reverse proxy blocks calls to administrative paths of the server for IPs that are outside of specific ranges. Requests are forwared to the server with added "xforwared" headers.

The nginx reverse proxy approach makes it so you are free to alter the nginx config in order to allow more services to be hosted on the same machine.

> Be aware that you have to expose the proxy container to other external networks in order to be able to route to containers outside of the current compose file.
