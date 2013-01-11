execute 'apt-update' do
  command 'apt-get update'
end

package 'python-setuptools' do
  action :install
end

package 'python-dev' do
  action :install
end

package 'libmysqlclient18' do
  action :install
end

execute 'pip-install' do
  command 'easy_install pip'
end

execute 'pip-distribute' do
  command 'pip install distribute --upgrade'
end

execute 'pip' do
  command 'pip install toto pbkdf2 MySQL-python'
end
