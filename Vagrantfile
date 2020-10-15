# vi: set ft=ruby :

BOXNAME = "debian/contrib-buster64"

FOG_HOSTS = {
  :fogserver => {
    :vagrantbox => BOXNAME,
    :hostname   => "fogserver",
    :ip         => "172.20.4.2"
  },
  :fogclient => {
    :vagrantbox => BOXNAME,
    :hostname   => "fogclient"
  }
}

Vagrant.configure("2") do |config|

  FOG_HOSTS.each do |name,settings|
    config.vm.define name do |conf|
      conf.vm.box      = settings[:vagrantbox]
      conf.vm.hostname = settings[:hostname]

      if settings[:hostname] == "fogclient"
        conf.vm.provider :virtualbox do |virtualbox|
          virtualbox.gui = "true"
          virtualbox.customize [
            'modifyvm', :id,
            '--nic1', 'intnet',
            '--intnet1', 'pxe_network',
            '--boot1', 'net',
            '--boot2', 'none',
            '--boot3', 'none',
            '--boot4', 'none'
          ]
        end
      else
        conf.vm.network "private_network", ip: settings[:ip], virtualbox__intnet: "pxe_network"
      end

      conf.vm.provision "shell", inline: <<-SHELL

        if [ "$HOSTNAME" = "fogserver" ]; then

          apt-get update
          apt-get install expect -y

          if [ ! -f /home/vagrant/1.5.9.tar.gz ]; then
            wget https://github.com/FOGProject/fogproject/archive/1.5.9.tar.gz
            tar -xzvf 1.5.9.tar.gz
          fi

          sudo /vagrant/install-fog.sh

        fi

      SHELL

    end
  end

end
