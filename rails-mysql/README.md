# Rails box

Vagrant box available [here](https://app.vagrantup.com/nu12/)

## Using the box
Init the Vagrantfile with
```shell
vagrant init nu12/rails-mysql
```
Or configure Vagrantfile as below
```
Vagrant.configure("2") do |config|
  config.vm.box = "nu12/rails-mysql"
end
```
Access the box
```shell
vagrant up && vagrant ssh
```

## Box creation

### Initial Vagrantfile

```
Vagrant.configure("2") do |config|
  config.vm.box = "nu12/rails"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
end
```

### Install Mysql

```shell
sudo apt-get purge -y sqlite3 libsqlite3-dev
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev
```

### Create vagrant user

Guest machine

Enter mysql with root
```shell
sudo mysql
```

Create new user
```sql
mysql> CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant';
mysql> GRANT ALL PRIVILEGES ON * . * TO 'vagrant'@'localhost';
mysql> FLUSH PRIVILEGES;
mysql> QUIT;
```

Write mysql users at home directory
```shell
printf "User: vagrant | Password: vagrant\n" > ~/mysql-users
```

#### Clear history before package

Guest machine
```shell
rm -f $HISTFILE
history -c
sudo shutdown -h now

#### Available users and passwords
User | Password
--- | ---
vagrant | vagrant


### Package

Host machine
```shell
vagrant package --output rails-mysql.box --vagrantfile Vagrantfile
```
