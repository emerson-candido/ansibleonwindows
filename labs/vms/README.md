AnsibleOnWindows - LABs

## Table of contents

- [1.0 Lab environment](#1.0_lab-environment)
	- [1.1 Diagram](#1.1_diagram)
	- [1.2 VMs](#1.2_VMs)
	- [1.3 Authentication](#1.3_authentication)
-	[2.0 Getting started](#2.0_getting-started)
	- [2.1 Requirements](#2.1_requirements)
		- [2.1.1 Memory](#2.1.1_Memory)
		- [2.1.2 Disk](#2.1.2_Disk)		
		- [2.1.3 VirtualBox](#2.1.3_VirtualBox)
			- [2.1.3.1 VirtualBox installation)(#2.1.3.1_virtualbox-installation)
			- [2.1.3.2 VirtualBox network)(#2.1.3.2_virtualbox-network)
		-	[2.1.4 Vagrant](#2.1.2_vagrant) 
			- [2.1.4.1 Vagrant installation](#2.1.2.1_vagrant-installation)
			- [2.1.4.2 Vagrant boxes](#2.1.2.2_vagrant-boxes)
		- [2.1.5 Ansible](#2.1.3_ansible)
			- [2.1.5.1 Ansible installation](#2.1.3.1_ansible-installation)
	- [2.2 Deployment](#2.2_Deployment)
		- [2.2.1 Clone repository](#2.2.1_clone-repository)
		- [2.2.2 VirtualBox installation](#2.2.2_virtualbox-installation)
		- [2.2.3 Vagrant installation](#2.2.3_vagrant-installation)
		- [2.2.4 Vagrant up](#2.2.4_vagrant-up)


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

