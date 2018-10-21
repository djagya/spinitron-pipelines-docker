Image name: `djagya/spinitron_pipelines`.
To build and push:

- `docker build -t djagya/spinitron_pipelines .`
- `docker push djagya/spinitron_pipelines`

To access the db from the main container we need to use (host is important): `mysql -uroot -p -hmariadb`

To start: `docker-compose up`

To login to web container: `docker exec web /bin/bash`
