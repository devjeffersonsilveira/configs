#! bash

## import configs
sudo chmod 0700 .ssh

## permissions
visudo

## get default applications
yay -S cronie cpupower guake gnome-disk-utility baobab gnome-power-manager npm zsh fzf keepassxc --noconfirm
yay -S spotify conky-manager2-git conky-lua-nv xfce4-dockbarx-plugin --noconfirm

## change default shell
chsh -s /bin/zsh

## add user to groups
sudo gpasswd -a $USER audio
sudo gpasswd -a $USER video

## change pulse default microphone
pactl set-source-mute @DEFAULT_SOURCE@ toggle 

## performance
sudo echo "governor='performance'" >>/etc/default/cpupower
sudo echo "vm.swappiness=10" >/etc/sysctl.d/99-swappiness.conf

## add .zshrc
curl https://raw.githubusercontent.com/jalxes/configs/master/.zshrc -o ~/.zshrc

## develop zone

## get develop applocations
yay -S clipit php composer go yarn nvm gvim pip docker docker-compose firefox-developer-edition dbeaver --noconfirm
yay -S slack-desktop rambox insomnia --noconfirm

## add user to groups
sudo gpasswd -a jalxes docker

## systemctl stuff
sudo systemctl enable docker

## install pip stuff
sudo pip install virtualenv

## install composer global libs
composer global require phpunit/phpunit:@stable friendsofphp/php-cs-fixer:@stable phpmd/phpmd:@stable squizlabs/php_codesniffer:@stable phpstan/phpstan:@stable
curl https://raw.githubusercontent.com/jalxes/configs/master/.php-cs -o ~/.php-cs

## Audio stuff

## infra
yay -S jack2-dbus
yay -S linux-rt-lts jack2-dbus lib32-jack2 a2jmidid realtime-privileges ttymidi

## more groups
sudo gpasswd -a jalxes uucp
sudo gpasswd -a jalxes lock
sudo gpasswd -a jalxes realtime

## locked memory
ulimit -l unlimited

## management apps
yay -S cadence qtractor ardour-git carla audacity patchage jalv

## samplers
yay -S fluidsynth linuxsampler qsynth qsampler

## helpers
sherlock.lv2 qmidiarp

## loopers
yay -S sooperlooper-git freewheeling

## base apps for playing
yay -S hydrogen-git hydrogen-drumkits
yay -S drmr-git zita-at1 guitarix2 non-daw

## learning
yay -S musescore pianobooster

## plugins packs
yay -S calf vee-one x42-plugins distrho-vst-git
yay -S ArtyFX

## synths
yay -S aeolus setbfree zynaddsubfx yoshimi mda.lv2 helm bristol
