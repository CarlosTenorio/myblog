#Install dependencies
install-dep:
	sudo apt-get update
	sudo apt-get install gettext
	sudo apt-get install nginx

# Development
runserver:
	python manage.py runserver

#Deployment
check-deploy:
	python manage.py check --deploy
deploy:
	gunicorn myblog.wsgi:application -w=4 --bind=0.0.0.0:8000
nginx:
	sudo ln -s /etc/nginx/sites-available/ctenoriop.pythonanywhere.com.conf /etc/nginx/sites-enabled/

# Statics
collectstatic:
	gulp
	python manage.py collectstatic

# Migrations
makemigrations:
	python manage.py makemigrations

migrate:
	python manage.py migrate

# Lenguages
compile-lang:
	django-admin compilemessages -l=es -l=en
update-lang:
	django-admin makemessages -l es --ignore="node_modules/*" --ignore="myblogvenv/*"

# Task automation
gulp:
	gulp watch

# Install python packages
pip:
	pip install -r requirements.txt
