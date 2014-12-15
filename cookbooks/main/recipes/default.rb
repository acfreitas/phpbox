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

#Install environment dependences
execute "sudo apt-get update"
%w(
  git curl php5 php5-gd php5-curl php5-xdebug php5-json apache2 php5-mysql libapache2-mod-php5 unzip
).each do |package_name|
  package package_name do
    action :install
  end
end

#Install Composer global
execute "curl -sS https://getcomposer.org/installer | php"
execute "mv composer.phar /usr/local/bin/composer"

#Create a symbolic link 
#form /vagrant (fold shared whit guest) to /var/www/resap (Apache2)
execute "if [ ! -L /var/www ]; then
          sudo rm -rf /var/www
          sudo ln -s /vagrant /var/www
        fi"

#Enable mod_rewrite of Apache2
#@see http://jaydson.org/habilitar-mod_rewrite-no-apache/
execute "sudo a2enmod rewrite"
execute "sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/sites-available/default"
execute "sudo service apache2 reload"
