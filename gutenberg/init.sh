#!/bin/bash
docker compose run --rm gutenberg python manage.py migrate
docker compose build
docker compose run --rm gutenberg python manage.py updatecatalog
docker compose run --rm gutenberg python manage.py collectstatic
docker compose up