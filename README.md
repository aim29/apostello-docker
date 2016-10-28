postello-docker

Deploy [apostello](https://github.com/monty5811/apostello) with Docker.

## Getting Started

Prerequisites: git, docker and docker compose

```
git clone https://github.com/monty5811/apostello-docker.git
cp .env.example .env
vim .env # fill in this file
docker-compose build # build the containers
docker-compose up -d # start apostello in the background
docker-compose exec django ./manage.py migrate # migrate database
docker-compose exec django ./manage.py collectstatic --noinput # collect static files
```

## Backups

### Database

* Backup: `docker-compose exec postgres backup`
* Restore: `docker-compose exec postgres restore [filename]`

### Let's Encrypt

The `.caddy` folder is automatically synced to `backups/.caddy`

## Surviving reboots

### Install supervisor:

```
apt-get update
apt-get install supervisor
```

### Setup apostello

Create `/etc/supervisor/conf.d/apostello.conf` and add the following (be sure to add the correct path):
```
[program:apostello]
command=docker-compose up
directory=/path/to/apostello
redirect_stderr=true
autostart=true
autorestart=true
priority=10
```

Then run
```
supervisorctl reread
supervisorctl start apostello
```

## Other Commands

* View all logs `docker-compose logs`
* View only django logs `docker-compose logs django`
* Scale a container:  `docker-compose scale django=2`
