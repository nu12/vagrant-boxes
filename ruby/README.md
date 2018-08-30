# Ruby box
Vagrant box available [here](https://app.vagrantup.com/nu12/)

## Using the box
Init the Vagrantfile with
```shell
vagrant init nu12/ruby
```
Or configure Vagrantfile as below
```
Vagrant.configure("2") do |config|
  config.vm.box = "nu12/ruby"
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
  config.vm.box = "bento/ubuntu-18.04"
end
```

### Install Ruby

Guest machine
```shell
sudo apt-get update -y
sudo apt-get upgrade -y
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm requirements
rvm install 2.5.1
rvm use 2.5.1 --default
```

#### Clear history before package

Guest machine
```shell
rm -f $HISTFILE
history -c
sudo shutdown -h now
```

### Package

Host machine
```shell
vagrant package --output ruby.box --vagrantfile Vagrantfile
```