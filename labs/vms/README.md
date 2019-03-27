AnsibleOnWindows - LABs

## Table of contents

- [1.0 Lab environment](#10-lab-environment)
	- [1.1 Diagram](#11-diagram)
	- [1.2 VMs](#12-VMs)
	- [1.3 Authentication](#13-authentication)
-	[2.0 Getting started](#20-getting-started)
	- [2.1 Requirements](#21-requirements)
		- [2.1.1 Memory](#211-Memory)
		- [2.1.2 Disk](#212-Disk)		
		- [2.1.3 VirtualBox](#213-VirtualBox)
			- [2.1.3.1 VirtualBox - CentOS](#2131-virtualbox-centos)
			- [2.1.3.2 VirtualBox - Fedora](#2132-virtualbox-fedora)
		-	[2.1.4 Vagrant](#214-vagrant) 
			- [2.1.4.1 Vagrant installation](#2141-vagrant-installation)
			- [2.1.4.2 Vagrant boxes](#2142-vagrant-boxes)
		- [2.1.5 Ansible](#215-ansible)
			- [2.1.5.1 Ansible installation](#2151-ansible-installation)
	- [2.2 Deployment](#22_Deployment)
		- [2.2.1 Install Git](#221-install-git)
		- [2.2.2 Install VirtualBox](#222-install-virtualbox)
		- [2.2.3 Install Vagrant](#223-install-vagrant)
		- [2.2.4 Clone repository](#224-clone-repository)
		- [2.2.5 Deployment script](#225-deployment-script)


## 1.0 Lab environment

The AnsibleOnWindows LABs provide a stack of virtual machines to practice exercises proposed at this course.


## 1.1 Diagram

The diagram below describes the structure of VMs provided to this lab:

        		 +--------+
        		 |  DC01  |
        		 +---+----+
								 |
								 |
 		+--------+   |   +-----------+
 		| AWX01  +---+---+ ANSIBLE01 |
 		+---+----+       +----+------+
				|									|
				|									|			
		+---+----+       +----+------+
		| SRV01  +-------+  SRV02    |
		+--------+       +-----------+


## 1.2 VMs

The table below describes the list of VMs that are predicted to be provisioned:

		 +-----------+----------------+---------+-----------------------------+----------+
		 | HOSTNAME  |  IP Address    |  Roles  | SO Version                  |  Memory  |
		 +-----------+----------------+---------+-----------------------------+----------|
		 | DC01      |  192.168.75.10 | DC, DNS | Win Server 2019 Server Core |  2048MB  |               
		 +-----------+----------------+---------+-----------------------------+----------+
		 | ANSIBLE01 |  192.168.75.20 | ANSIBLE | CentOS 7.6                  |   512MB  |
		 +-----------+----------------+---------+-----------------------------+----------+
		 | AWX01     |  192.168.75.25 | AWX01   | CentOS 7.6                  |   512MB  |
		 +-----------+----------------+---------+-----------------------------+----------+
		 | SRV01     |  192.168.75.30 | SERVER  | Win Server 2019 Server Core |		512MB  |               
		 +-----------+----------------+---------+-----------------------------+----------+
		 | SRV02     |  192.168.75.35 | SERVER  | Win Server 2019 Server Core |		512MB  |               
		 +-----------+----------------+---------+-----------------------------+----------+


## 1.3 Authentication

The following user is available to connect on VMs:
User: Ansible
Pass: ansible@123

The server DC01 provides the Domain Controller function for domain ansibleonwindows.local, therefore, you can also logon on Windows VMs that were provisioned as member of the domain using the same credential provides above, however, it is necessary to add the domain netbios name "AnsibleOnWin", according example below:

AnsibleOnWin\Ansible


## 2.0 Getting started

This topic can drives you to create your lab environment.


## 2.1 Requirements:

Before start the creation of your enviroment, it is required to evaluate if your computers can covers the requirements described at next topics.

It is important to consider that at the moment, the infrastructure was designed to support only the following environments:

	- Linux CentOS 7.4 or higher
	- Fedora 29 or higher

Also, the virtualizer choosed for the environmnet is VirtualBox.

You can use other distributions or other OS, however, it is not possible to ensure that procedures described at this document can work properly.


## 2.1.1 Memory

The topic [1.2 VMs](#12-VMs) provides details about memory requirements for each VM, therefore, considering the size, it´s recommeded a minimal of8GB of memory on your host computer.


## 2.1.2 Disk

The virtual machines are configured on Vagrant to be created on VirtualBox using dynamic disks, therefore, the initial size are predicted to allocated 10GB, therefore, during the utilization of virtual machines more data can be required to be allocated, therefore, at minimal of 20GB is required.


## 2.1.3 VirtualBox

The VirtualBox was selected as the virtualizer for environment, therefore, in order to install that the following steps has to be completed:


## 2.1.3.1 VirtualBox - CentOS

# Add the repository
cd /etc/yum.repos.d/
wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo

# Install dependencies
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Update packages
yum update

# Install dependencies
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

#Install VirtualBox
yum install VirtualBox-6.0

#Rebuild kernel modules
/usr/lib/virtualbox/vboxdrv.sh setup

#Add your own account as member of vboxusers groups
usermod -a -G vboxusers user_name


References:
https://www.if-not-true-then-false.com/2010/install-virtualbox-with-yum-on-fedora-centos-red-hat-rhel/


## 2.1.3.2 VirtualBox - Fedora

# Add the repository
cd /etc/yum.repos.d/
wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo

# Update packages
dnf update

# Install dependencies
dnf install binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms qt5-qtx11extras libxkbcommon

#Install VirtualBox
dnf install VirtualBox-6.0

#Rebuild kernel modules
/usr/lib/virtualbox/vboxdrv.sh setup

#Add your own account as member of vboxusers groups
usermod -a -G vboxusers user_name


References:
https://www.if-not-true-then-false.com/2010/install-virtualbox-with-yum-on-fedora-centos-red-hat-rhel/


## 2.1.4 Vagrant

Vagrant is a tool that provides the automation to create VMs on virtualizers, like VirtualBox, in order to create our Lab environment, this tool will be required to complete steps described at deployment topics.


## 2.1.4.1 Vagrant installation

# For CentOS and Fedora
sudo yum install "https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.rpm"

# Install the plugin reload, that will be required during the provisioning process
sudo vagrant plugin install vagrant-reload


## 2.1.4.2 Vagrant boxes

The Vagrant boxes are images to provision VMs on environment, before start the process it is required to download the boxes below: 

	- CentOS 7.6 (centos/7)
		(vagrant box add centos/7)
			
	- Windows Server 2016 Standard (gusztavvargadr/windows-server version:1809.0.1901)
		(vagrant box add gusztavvargadr/windows-server --box-version 1809.0.1901)
	

## 2.1.5 Ansible

Ansible is required on your computer to provisioning the required tasks associated on Vagrantfile, therefore, you have to complete the following actions:

# CentOS and Fedora
sudo yum install epel-release
sudo yum install ansible


## 2.2 Deployment

This topic is designed to drive you during the deployment of virtual machines on your computer, in order to reduce steps, you can run the script "AnsibleOnWindows.sh", that you can achieve follow steps below:

1 - Install git

# CentOS / Fedora
	sudo yum install git

2 - Clone the repository
	git clone

3 - Go to ansibleonwindows directory, and then run the "AnsibleOnwinodws.sh" script
./ansibleonwindows/AnsibleOnWindows.sh

The script is predict to cover the following steps:

	-	Check memory requirements
	- Check disk requirements
	- Install VirtualBox 
	- Install Vagrant
	- Install Ansible
	- Download required Vagrant boxes
	- Create the VM DC01
	- Create the VM Ansible01
	- Create the VM AWX01
	- Create the VM SRV01
	- Create the VM SRV02
