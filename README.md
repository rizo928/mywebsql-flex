# docker-mywebsql

Docker container for [MyWebSQL][3]

" Simplified Database Web Administration. For MySQL, SQLite and PostgreSQL databases. Manage your databases over the web using a secure and intuitive interface with blazing fast performance "

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 15.04 use the commands:

    $ sudo apt-get update
    $ wget -qO- https://get.docker.com/ | sh

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d -p xxxx:80 quantumobject/docker-mywebsql

Check port and point your browser to http://[ip]:xxxx/  and you be able to access postgreSQL or MYSQL with server:custom server using ip or domain name , this only work when you allow in the database configuration external access to postgreSQL and MYSQL like when you used container with the port expose:

    $ docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
    $ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d -p 3306:3306 mysql

but this is not recomended, better to used docker link between container :

    $ docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres
    $ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql
    
and you will link with database by 

    $ docker run -d -p 80 --name mywebsql --link some-postgres:db quantumobject/docker-mywebsql
    
or for to link to MYSQL container 

    $ docker run -d -p 80 --name mywebsql --link some-mysql:db quantumobject/docker-mywebsql
    
in this two case the server: custom server option will be used the db like domain name. 


## More Info

About mywebsql [mywebsql.net][1]

To help improve this container [quantumobject/docker-mywebsql][5]

For additional info about us and our projects check our site [www.quantumobject.org][6]

[1]:http://mywebsql.net/
[2]:https://www.docker.com
[3]:http://mywebsql.net/downloads/
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-mywebsql
[6]:https://www.quantumobject.org/
