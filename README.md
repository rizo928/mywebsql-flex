# docker-mywebsql

Initial version for this docker container cloned from QuantumObject/docker-mywebsql.

This updated version allows more flexiblity in terms of mapping a volume for updating myWebSQL configuration files.
See below for instructions on mapping the /config directory.  See the startup.sh script in the GitHub repository for change details.

Docker container for [MyWebSQL][3]

" Simplified Database Web Administration. For MySQL, SQLite and PostgreSQL databases. Manage your databases over the web using a secure and intuitive interface with blazing fast performance "

## Usage

To run container use the command below:

    $ docker run -d -p xxxx:80 rizo928/mywebsql-flex

Check port and point your browser to http://[ip]:xxxx/  and you be able to access postgreSQL or MYSQL with server:custom server using ip or domain name , this only work when you allow in the database configuration external access to postgreSQL and MYSQL like when you used container with the port expose:

    $ docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
    $ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d -p 3306:3306 mysql

but this is not recomended, better to used docker link between container :

    $ docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres
    $ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql
    
and you will link with database by 

    $ docker run -d -p 80 --name mywebsql --link some-postgres:db rizo928/mywebsql-flex
    
or for to link to MYSQL container 

    $ docker run -d -p 80 --name mywebsql --link some-mysql:db rizo928/mywebsql-flex
    
in this two case the server: custom server option will be used the db like domain name. 

If you are interested changing myWebSQL configuration files, simply map a local directory to the container diretory /config.  For example:

	$ docker run -d -p xxxx:80 -v /mylocaldir:/config rizo928/mywebsql-flex 

If the /config directory is mapped (exists in the container), the myWebSQL configuration files will be copied into it when the container is first started.  You can then modify the myWebSQL configuration files in /mylocaldir, restart the container and your configuration changes will be live.  This is highly useful to for instance specify your specific database instances in servers.php so they show up in the login drop down list.

## More Info

About mywebsql [mywebsql.net][1]

To help improve this container [rizo928/mywebsql-flex][5]

[1]:http://mywebsql.net/
[2]:https://www.docker.com
[3]:http://mywebsql.net/downloads/
[4]:http://docs.docker.com
[5]:https://github.com/rizo928/mywebsql-flex
