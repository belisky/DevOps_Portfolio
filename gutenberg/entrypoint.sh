#!/usr/bin/env bash
until nc -vz ${DATABASE_HOST} ${DATABASE_PORT}; do
  echo "waiting for database to be ready..."
  sleep 1
done

echo
echo migrating database
echo ------------------
./manage.py migrate

echo
echo updating catalog
echo ----------------
./manage.py updatecatalog

# echo
# echo collecting static files
# echo -----------------------
# ./manage.py collectstatic

echo
echo running server
echo --------------
./manage.py runserver 0.0.0.0:8000
