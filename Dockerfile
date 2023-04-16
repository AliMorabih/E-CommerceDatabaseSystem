# Use the latest MySQL image
FROM mysql
# Set the working directory
WORKDIR /tmp
# Copy all the files to the working directory of the container
COPY MySqlDump/DumpSunday16.sql /tmp/
# Copy the main SQL file to docker-entrypoint-initdb.d.
# Scripts and SQL files in this folder are executed on container startup.
# This is specific to MySQL.
COPY MySqlDump/DumpSunday16.sql /docker-entrypoint-initdb.d
# Set the root password
ENV MYSQL_ROOT_PASSWORD example