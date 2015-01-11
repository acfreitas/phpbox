Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.hostname = 'phpbox'
  config.vm.network :private_network, ip: '192.168.33.10'
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'cookbooks'
    chef.add_recipe 'main'
  end
end
