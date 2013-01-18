Toto-Vagrant
============

This is a basic template to help you get up and running with [Toto][toto] in a [Vagrant][vagrant] dev environment.

Getting Started
---------------

Before you can use this project, make sure you have [Virtual Box][vb] and [Vagrant][vagrant] installed.
Once you've installed both tools, follow these steps:

1. Clone this repo.
2. From the project directory run the command `vagrant up`.
3. Wait for [Vagrant][vagrant] to configure the VM

Once you've completed these steps, the contents of the `static` directory will be hosted by [Nginx][nginx] at `http://42.42.42.42`.
By default, this is a blank page with a few script tags to get you set up with [toto.js][totojs]. The service in the `service`
directory will be listening at `http://42.42.42.42/service`. You can shutdown the environment with `vagrant halt` from anywhere in the
project directory structure. Run `vagrant` without any arguments for a list of available commands.

Commands
--------

There are a few special commands available to help you out:

- `vagrant toto <command>` - Passes `<command>` to your [Toto][toto] service so you can easily `--restart` after you make changes (or run your service with other options). This command actually runs `service/services.sh`, which acts as a proxy to your [Toto][toto] service and makes it easy to manage multiple services simultaneously.
- `vagrant nginx <signal>` - Calls `nginx -s <signal>` in the VM. In the special case where `<signal>` is `start`, this will call `nginx`.

Additional Setup
----------------

Along with the usual [Vagrant][vagrant] configuration and customization available to you, there are a few shortcuts to make basic configuration a bit easier.

- The `nginx-conf` directory is simlinked to the usual Ubuntu `/etc/nginx/sites-enabled` directory for easy [Nginx][nginx] setup.
- `setup-files/setup.sql` will be run after [MySQL][mysql] is installed in the dev environment to facilitate database creation and test data population.
- `setup-files/python.sh` will be run after [pip][pip] is installed so that you can install any extra packages or modules your service requires.
- Finally, `setup-files/post-setup.sh` will run after all other steps are complete for any final cleanup.

_Note: all scripts are run in the VM as root._

For more advanced setup, check out the documentation for [Vagrant][vagrantdocs] and [Toto][totodocs].

[vb]:https://www.virtualbox.org/
[vagrant]:http://www.vagrantup.com/
[vagrantdocs]:http://docs.vagrantup.com/v1/docs/index.html
[pip]:http://pypi.python.org/pypi/pip
[nginx]:http://wiki.nginx.org
[mysql]:http://www.mysql.com/
[toto]:https://github.com/JeremyOT/Toto
[totojs]:https://github.com/JeremyOT/TotoClient-JS
[totodocs]:http://jeremyot.com/Toto/docs/
