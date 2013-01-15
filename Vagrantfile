class TotoCommand < Vagrant::Command::Base
  def execute
    args = ARGV[1..-1].join(' ')
    command = args.index('start') ? "/var/toto/service/services.sh #{args} > /dev/null && echo 'Ran #{ARGV.join(' ')}'" : "/var/toto/service/services.sh #{args}"
    @env.primary_vm.channel.sudo(command) do |s, d|
      puts d
    end
  end
end

class NginxCommand < Vagrant::Command::Base
  def execute
    command = ARGV[1] == 'start' ? 'sudo nginx' : 'sudo nginx -s ' + ARGV[1]
    @env.primary_vm.channel.execute(command) do |s, d|
      puts d
    end
  end
end

Vagrant.commands.register(:toto) { TotoCommand }
Vagrant.commands.register(:nginx) { NginxCommand }

Vagrant::Config.run do |config|

  config.vm.box = "precise64"

  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :hostonly, "42.42.42.42"

  config.vm.share_folder "static-files", "/var/toto/static", "static"
  config.vm.share_folder "service-files", "/var/toto/service", "service"
  config.vm.share_folder "nginx-conf", "/var/toto/nginx-conf", "nginx-conf"
  config.vm.share_folder "setup-files", "/var/toto/setup-files", "setup-files"

  config.vm.provision :chef_solo do |chef|
    chef.json = {:mysql => {:server_debian_password => 'admin', :server_root_password => 'admin', :server_repl_password => 'admin'}}
    chef.add_recipe "nginx"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql::client"
    chef.add_recipe "mysql_setup"
    chef.add_recipe "python"
    chef.add_recipe "toto"
    chef.add_recipe "post_setup"
  end

end
