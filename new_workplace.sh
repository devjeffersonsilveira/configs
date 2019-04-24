#! bash

## import configs from drive
sudo chmod 0700 .ssh

## permissions
visudo

## get default applications
yay -S npm zsh fzf spotify --noconfirm

## get develop applocations
yay -S copyq php composer yarn nvm vim slack-desktop pip docker docker-compose visual-studio-code-bin postman --noconfirm

## change default shell
chsh -s /bin/zsh

## add user to groups
sudo gpasswd -a jalxes docker
sudo gpasswd -a jalxes audio
sudo gpasswd -a jalxes video

## systemctl stuff
sudo systemctl enable docker
sudo systemctl enable gdm
sudo systemctl disable lightdm
sudo systemctl start gdm
sudo systemctl stop lightdm

## install pip stuff
sudo pip install virtualenv

## install composer global libs
composer global require phpunit/phpunit:@stable friendsofphp/php-cs-fixer:@stable phpmd/phpmd:@stable squizlabs/php_codesniffer:@stable phpstan/phpstan:^0.9.2
