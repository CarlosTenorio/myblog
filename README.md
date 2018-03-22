# Personal Blog
Personal Django Blog

## Prerequisits
docker & docker-compose

## Instructions
Install frontend dependencies

```
make install
```

Run gulp and collects static files from each of the applications

```
make collectstatic
```

Propagate changes make to the models into the database schem

```
make makemigrations
make migrate
```

## Environments

Local environment

```
make devel
```
Deployment

```
make deploy
```

## Lenguages

Compile and prepare the key to translate on .po file
```
make update-lang
```
Update the translations
```
make update-lang
```
