# Run Observium Community Edition in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/observium-ce.svg)](https://hub.docker.com/r/zcalusic/observium-ce/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/observium-ce.svg)](https://hub.docker.com/r/zcalusic/observium-ce/)

This Docker container makes it easy to get an instance of Observium Community Edition up and running.  Learn more about Observium: <https://observium.org/>

## Usage

Create the MySQL database:

```
mysql -u root -p <mysql root password>
mysql> CREATE DATABASE observium;
mysql> GRANT ALL PRIVILEGES ON observium.* TO 'observium'@'localhost' -> IDENTIFIED BY '<password>';
```

Pull image:

```
sudo docker pull zcalusic/observium-ce
```

Edit docker-compose.yml to suit your environment, then run container:

```
sudo docker-compose up -d
```

Create initial user:

```
sudo docker exec -it <container_name> /opt/observium/adduser.php <username> <password> 10
```

## Configuration

* `TZ`
  * Timezone (default: `Etc/UTC`).

* `DB_HOST`
  * MySQL database host (default: `127.0.0.1`).

* `DB_PORT`
  * MySQL database port (default: `3306`).

* `DB_USER`
  * MySQL database username (default: `username`).

* `DB_PASS`
  * MySQL database password (default: `password`).

* `DB_NAME`
  * MySQL database name (default: `observium`).

* `LISTEN_ADDR`
  * Nginx listen address:port (default: `80`).

* `BASE_URL`
  * Observium base URL (default: `http://observium.example.com/`).

* `PHP_MEMORY_LIMIT`
  * PHP memory limit (default: `256M`).

## Building container image

```
sudo make docker_build
```
