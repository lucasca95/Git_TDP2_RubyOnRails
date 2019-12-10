#! /bin/sh

# Wait for MySQL
until nc -z -v -w 30 $DB_HOST $DB_PORT; do
 echo 'Waiting for MySQL...'
 sleep 5
done
echo "MySQL is up and running!"