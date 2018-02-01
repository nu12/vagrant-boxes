# Rails box
Vagrant box available [here](https://app.vagrantup.com/nu12/)

## Using the box
Init the Vagrantfile with
```shell
vagrant init nu12/rails
```
Or configure Vagrantfile as below
```
Vagrant.configure("2") do |config|
  config.vm.box = "nu12/rails"
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
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
end
```

### Install Ruby and Rails

```shell
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y git curl sqlite3 libsqlite3-dev
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
sudo apt-get install git curl sqlite3 libsqlite3-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm requirements
rvm install 2.3.4
rvm use 2.3.4 --default
gem install rails -v 5.1.4 -N
```
### Package

```shell
vagrant package --output rails.box --vagrantfile Vagrantfile
```

### References

[Node v8](http://nodesource.com/blog/installing-node-js-8-tutorial-linux-via-package-manager/)
[Yarn](https://yarnpkg.com/lang/en/docs/install/)
[Yarn & Rails](http://nithinbekal.com/posts/yarn-rails/)