
Sintezis Web Stack
===

This repository contains starter stack for developing web applications. Stack includes several modules included as git submodules. 

Local vagrant VM is defined and provisioned using Vagrantfile, its a fork of [sinatra-dev-box](http://github.com/Struki84/sinatra-web-stack) and is used for **development only**. Visit original repo for setup instructions

> run `vagrant up` to setup the vagrant VM

## Installation

+ clone or downlod the repository
+ navigate to project folder
+ edit `Vagrantfile` if needed (eg. vm host name)
+ run `vagrant up`, get some coffee... this will take a long time. Virtual machine will provision (setup) itself
+ run `vagrant status` to verify virtual machine status
+ visit the server on local web adress set in `Vagrantfile`, eg `http://www.web-stack.dev:8080`

> edit this lines to setup vagrant box for access on your local machine.
```
	node.vm.network :private_network, ip: "192.168.100.102"
	node.vm.hostname = 'sintezis-web.dev'
	node.hostmanager.aliases = %w(www.sintezis-web.dev sintezis-web.dev)
```

## Modules

+ api module
+ security module
+ angular module

### API 

API CRUD interface for accessing and manipulating DB records. For detailed description refer to original [module repo](http://github.com/Sintezis/api-module) read me file. 

### Security

Handles user validation, registration (?), and request validation for specified `User` model or `profile`. Refer to original [module repo](http://github.com/Sintezis/security-module) read me file for detailed description

### Angular

Controller for loading angular index view and associated js libraries

## Architecture & folders

```
	api/
	web/
	public/
	models/
	thin/
	Gemfile
	Vagrantfile
	config.ru 
	db_setup.yaml
```

### api/

```
api/
	controllers/
		records.rb
	helpers/
		api_request.rb
```

Application module containing `records.rb` controller used for handling all CRUD requests as defined in [api module](http://github.com/Sintezis/api-module) read me. Module also includes `api_helper`

### web/

### public/

```
	css/
	js/
	img/
```

### models/

### thin/

```
	thin.log
	thin.pid
```





