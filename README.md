# Docker Compose Collection
A set of helpful Docker containers for local development.

## How to use the Docker Compose Collection in your environment

### Prerequisites
First install Docker CE for your system (https://docs.docker.com/install/).

Then proceed to install mkcert (https://github.com/FiloSottile/mkcert) and create a local CA Root certificate by calling `mkcert -install`.

### Notes
This utilizes `docker-compose` to boot up all requirements and scripts. The `docker-compose.yml` is part of the root directory and every `docker-compose ...` command has to be called in there (preferably with root rights).

Additional files and scripts are located in `./.docker` for booting up the images and creating the according configuration.

### Setup
Execute the `./.docker/create-certs.sh` script to create the required locallly certified SSL certificates with mkcert, which are passed to `nginx` as valid. 

Ensure that your `.env` file is complete and correct before you run the containers. If you make changes to the `.env` you have to remove all containers `docker-compose down`, build them `docker-compose build` and run again. If you down containers, they are removed! Initial setup has to be repeated (e.g. database seeding etc.).

### Run
Call `docker-compose up -d nginx`. This will boot up the nginx, php and mysql systems to use and interconnect everything in one network. The initial boot time might be long because `docker` has to build the images the first time.

#### Working with the containers
* Stop containers: `docker-compose stop ...`
* Remove all containers: `docker-compose down`
* Boot up: `docker-compose up -d nginx` (-d for daemon mode)

You may change the `docker-compose.yml` to set all containers to `restart: always`. They will restart in case of errors etc.

### Profit!
The server is running at `https://localhost:8443`. The certificate is valid and everything is prepared.

You may also change your local `hosts` information, as the certificate is generated for
* development.local
* development.test
* development.app

Most other containers such as `redis` etc. map their native default port to the same local machine port.