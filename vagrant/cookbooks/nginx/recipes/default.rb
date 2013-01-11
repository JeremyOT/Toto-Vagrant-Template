execute 'apt-update' do
  command 'apt-get update'
end

package 'nginx' do
  action :install
end

execute 'remove-default-conf' do
  command 'rm -r /etc/nginx/sites-enabled'
end

execute 'remove-default-conf' do
  command 'ln -s /var/toto/nginx-conf /etc/nginx/sites-enabled'
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action :enable
  action :restart
end
