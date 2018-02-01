# Rails box

## Initial Vagrantfile

```
Vagrant.configure("2") do |config|
  config.vm.box = "nu12/rails"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
end
```

## Install Ruby and Rails

```shell
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev

## Create vagrant user

```shell
mysql -uroot -proot
```
```sql
mysql> CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant';
mysql> GRANT ALL PRIVILEGES ON * . * TO 'vagrant'@'localhost';
mysql> FLUSH PRIVILEGES;
mysql> QUIT;
```

### Available users and passwords
User: root 		| Password: root
User: vagrant 	| Password: vagrant

```
## Package

```shell
vagrant package --output rails-mysql.box --vagrantfile Vagrantfile
```
