install:
	docker-compose run --no-deps --rm npm install
	docker-compose run --no-deps --rm -T gulp

collectstatic:
	docker-compose run --rm gulp
	docker-compose run --rm web collectstatic --noinput
makemigrations:
	docker-compose run --rm --service-ports web makemigrations
migrate:
	docker-compose run --rm --service-ports web migrate

create-superuser:
	docker-compose run --rm --service-ports web createsuperuser

devel:
	docker-compose run --rm --service-ports dev
rebuild-web:
	docker-compose up --build web
rebuild-dev:
	docker-compose up --build dev
rebuild-gunicorn:
	docker-compose up --build gunicorn

gulp-watch:
	docker-compose run --rm -T gulp watch

# Deployment
check-deploy:
	docker-compose run --rm --service-ports web check --deploy
deploy:
	docker-compose run -d --rm --service-ports nginx

# DB
connect-db:
	docker exec -i -t myblogweb_db_1 /bin/bash
connect-gunicorn:
	docker exec -i -t myblogweb_gunicorn_1 /bin/bash
connect-dev:
	docker exec -i -t myblogweb_dev_run_1 /bin/bash


stop-rm:
	cd tasks && \
	./stop-rm-Dockers.sh
