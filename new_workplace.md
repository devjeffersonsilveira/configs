## import configs from drive

`sudo chmod 0700 .ssh`

## permissions

`visudo`

## get default applications

`yaourt -S npm zsh guake gdm copyq spotify --noconfirm`

## get develop applocations

`yaourt -S php composer yarn nvm vim slack-desktop docker docker-compose visual-studio-code-bin postman --noconfirm`

## change default shell

`chsh -s /bin/zsh`

## add user to groups

`sudo gpasswd -a jalxes docker`
`sudo gpasswd -a jalxes audio`
`sudo gpasswd -a jalxes video`

## systemctl stuff

`sudo systemctl enable docker`
`sudo systemctl enable gdm`
`sudo systemctl disable lightdm`
`sudo systemctl start gdm`
`sudo systemctl stop lightdm`

## install composer global libs

`composer global require phpunit/phpunit:@stable friendsofphp/php-cs-fixer:@stable`
`composer global require phpmd/phpmd:@stable squizlabs/php_codesniffer:@stable phpstan/phpstan:^0.9.2`

## install npm apps

`yarn global add nativefier`

## install nvm

`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.10/install.sh | bash`

## inbox

`nativefier https://inbox.google.com`
