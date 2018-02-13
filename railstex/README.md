# Rails box

Vagrant box available [here](https://app.vagrantup.com/pherde/)

## Using the box
Init the Vagrantfile with
```shell
vagrant init pherde/railstex
```
Or configure Vagrantfile as below
```
Vagrant.configure("2") do |config|
  config.vm.box = "pherde/railstex
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
  config.vm.box = "nu12/rails-mysql"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
end
```

### Install Texlive

```shell
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y texlive-base texlive-latex-base texlive-fonts-recommended texlive-math-extra texlive-pstricks texlive-science texlive-lang-portuguese texlive-lang-french 
sudo apt-get purge -f -y *-doc
```

#### Available users and passwords
User | Password
--- | ---
root | root
vagrant | vagrant


### Package

```shell
vagrant package --output railstex.box --vagrantfile Vagrantfile
```
