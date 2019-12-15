SHELL:=/bin/bash

update:
	vagrant box update --box bento/ubuntu-18.04

test:
	for i in ruby rails ; do \
		(cd ./$$i; vagrant up; vagrant package --output $$i.box --vagrantfile Vagrantfile; vagrant destroy -f); \
	done