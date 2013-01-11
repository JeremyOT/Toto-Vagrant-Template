execute 'create-database' do
  command 'echo "create database if not exists toto;" | mysql -u root --password=admin'
end
