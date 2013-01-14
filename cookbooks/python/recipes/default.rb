execute 'apt-update' do
  command 'apt-get update'
end

package 'python-setuptools' do
  action :install
end

package 'python-dev' do
  action :install
end

execute 'pip-install' do
  command 'easy_install pip'
end

execute 'run-script' do
  command '/var/toto/setup-files/python.sh'
end
