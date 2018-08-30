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
  config.vm.box = "nu12/ruby"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
end
```

### Install Rails

Guest machine
```shell
sudo apt-get update -y
sudo apt-get upgrade -y
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
gem install rails -v 5.2.1 -N
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
vagrant package --output rails.box --vagrantfile Vagrantfile
```

### References

* [Node v8](http://nodesource.com/blog/installing-node-js-8-tutorial-linux-via-package-manager/)
* [Yarn](https://yarnpkg.com/lang/en/docs/install/)
* [Yarn & Rails](http://nithinbekal.com/posts/yarn-rails/)