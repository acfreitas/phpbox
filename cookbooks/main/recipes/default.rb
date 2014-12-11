include_recipe 'apt'
include_recipe 'openssl'

node.set['platform'] = 'ubuntu'

# Mysql
node.set['mysql'] = {
  server_root_password: '',
  server_repl_password: '',
  server_debian_password: '',
  allow_remote_root: true,
  bind_address: '*',

  client: {
    packages: ['libmysqlclient-dev']
  }
}

include_recipe 'mysql::server'
include_recipe 'mysql::client'

# Packages
%w(
  git-core curl php5-cli php5-curl php5-xdebug php5-json phpunit
).each do |package_name|
  package package_name do
    action :install
  end
end