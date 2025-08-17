to login in wordpress
```
https://anakrash.42.fr/wp-login.php?loggedout=true&wp_lang=en_US
```

to see what containers are working now
```sh
docker ps
```

to enter data base container 
```sh
docker exec -it mariadb sh
# exec - run command in container
# -i means interactive, means able to input. 
# -t to see output like in console
```

to enter mariadb
```sh
mariadb -u wpuser -p
```

to show databases
```
show databases;
```

to select database
```
USE wordpress;
```

to display content of selected database
```
SELECT * FROM wp_comments;
```