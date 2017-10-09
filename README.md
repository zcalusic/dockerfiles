# Run Observium Community Edition in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/observium-ce.svg)](https://hub.docker.com/r/zcalusic/observium-ce/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/observium-ce.svg)](https://hub.docker.com/r/zcalusic/observium-ce/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/observium-ce.svg)](https://microbadger.com/images/zcalusic/observium-ce/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/observium-ce.svg)](https://microbadger.com/images/zcalusic/observium-ce/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/observium-ce.svg)](https://microbadger.com/images/zcalusic/observium-ce/)
[![License](https://images.microbadger.com/badges/license/zcalusic/observium-ce.svg)](https://microbadger.com/images/zcalusic/observium-ce/)

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

## License

```
The MIT License (MIT)

Copyright © 2017 Zlatko Čalušić

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
