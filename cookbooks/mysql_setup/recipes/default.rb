execute 'create-database' do
  command 'mysql -u root --password=admin < /var/toto/setup-files/setup.sql'
end
