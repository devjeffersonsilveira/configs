## import configs from drive
`sudo chmod 0700 .ssh`

## permissions
`visudo`

## get default applications
`yaourt -S npm zsh guake gdm copyq spotify --noconfirm`

## get develop applocations
`yaourt -S php yarn vim slack-desktop docker docker-compose php visual-studio-code-bin --noconfirm`

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
## install npm apps
`yarn global add nativefier`

## inbox
`nativefier https://inbox.google.com`