runserver:
	python manage.py runserver

# Statics
collectstatic:
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
