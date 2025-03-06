# dotfiles

## After archinstall

Add this at the end of `/etc/X11/xinit/xinitrc`:

```
#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
xrandr -s 1920x1080
exec i3
```

Activate `cronie`:

```bash
systemctl enable cronie
```

## TODO

* Install `ripgrep`
* Rename init_dotfiles.sh to install.sh
* Install yay + install betterlockscreen
* systemctl enable betterlockscreen@$USER

## More info

* https://www.youtube.com/watch?v=r_MpUP6aKiQ

## pkglist.txt

Contains all packages which need to be installed by `pacman`.

### Generate pkglist.txt

```sh
pacman -Qqen > pkglist.txt
```

### Install from pkglist.txt

```sh
pacman -S - < pkglist.txt
```

### Randomize wallpapers

For a random wallpaper every minute add the following line to `/etc/crontab`:

```sh
# Replace [USERNAME] accordingly
* * * * * [USERNAME] DISPLAY=:0 feh --bg-fill --randomize ~/.dotfiles/walls/*
```

### FAQ

#### How to close polybar?

```bash
polybar-msg cmd quit
```

#### How to restart i3

```bash
$mod+Shift+r
```

#### Polybar reference

* https://github.com/Z-8Bit/Polybar-Collection/blob/main/kanye/config.ini
