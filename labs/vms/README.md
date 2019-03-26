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
			- [2.1.3.1 VirtualBox installation](#2131-virtualbox-installation)
			- [2.1.3.2 VirtualBox network](#2132-virtualbox-network)
		-	[2.1.4 Vagrant](#214-vagrant) 
			- [2.1.4.1 Vagrant installation](#2141-vagrant-installation)
			- [2.1.4.2 Vagrant boxes](#2142-vagrant-boxes)
		- [2.1.5 Ansible](#215-ansible)
			- [2.1.5.1 Ansible installation](#2151-ansible-installation)
	- [2.2 Deployment](#22_Deployment)
		- [2.2.1 Clone repository](#221-clone-repository)
		- [2.2.2 VirtualBox installation](#222-virtualbox-installation)
		- [2.2.3 Vagrant installation](#223-vagrant-installation)
		- [2.2.4 Vagrant up](#224-vagrant-up)


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
     |                 |
     |                 |
 +---+----+       +----+------+
 | SRV01  +-------+  SRV02    |
 +--------+       +-----------+


## 1.2 VMs

The table below describes the list of VMs that are predicted to be provisioned:

 +-----------+----------------+---------+-----------------------------+
 | HOSTNAME  |  IP Address    |  Roles  | SO Version                  |
 +-----------+----------------+---------+-----------------------------+
 | DC01      |  192.168.75.10 | DC, DNS | Win Server 2019 Server Core |                   
 +-----------+----------------+---------+-----------------------------+
 | ANSIBLE01 |  192.168.75.20 | ANSIBLE | CentOS 7.6                  |
 +-----------+----------------+---------+-----------------------------+
 | AWX01     |  192.168.75.25 | AWX01   | CentOS 7.6                  | 
 +-----------+----------------+---------+-----------------------------+
 | SRV01     |  192.168.75.30 | SERVER  | Win Server 2019 Server Core |                  
 +-----------+----------------+---------+-----------------------------+
 | SRV02     |  192.168.75.35 | SERVER  | Win Server 2019 Server Core |                  
 +-----------+----------------+---------+-----------------------------+


## 1.3 Authentication

The following user is available to connect on VMs:
User: Ansible
Pass: ansible@123

The server DC01 provides the Domain Controller function for domain ansibleonwindows.local, therefore, you can also logon on Windows VMs that were provisioned as member of the domain using the same credential provides above, however, it is necessary to add the domain netbios name "AnsibleOnWin", according example below:

AnsibleOnWin\Ansible


## 2.0 Getting started

This topic can drives you to create your lab environment.


## 2.1 Requirements:

Before start the creation of your enviroment, it is required to evaluate if your computers can covers the requirements described below:


## 2.1.1 Memory


## 2.1.2 Disk


## 2.1.3 VirtualBox


## 2.1.4 Vagrant


## 2.1.4.1 Vagrant installation


## 2.1.4.2 Vagrant boxes
	- CentOS 7.6
	- Windows Server 2016 Standard 
	

## 2.1.5 Ansible


## 2.2 Deployment

