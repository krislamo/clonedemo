# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-buster64"
  config.vm.network "private_network", ip: "172.20.4.2"

  config.vm.provision "shell", inline: <<-SHELL

    apt-get update
    apt-get install expect -y

    if [ ! -f /home/vagrant/1.5.9.tar.gz ]; then
      wget https://github.com/FOGProject/fogproject/archive/1.5.9.tar.gz
      tar -xzvf 1.5.9.tar.gz
    fi

    sudo /vagrant/install-fog.sh

  SHELL

end
