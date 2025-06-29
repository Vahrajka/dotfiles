Tested on Endeavouros latest with:
sddm-greeter --test-mode --theme /path/to/theme
and also at login screen after boot up.
As the new sddm-greeter-qt6 version doesn't work for me ymmv and a lot of the great themes out there just don't work any more which is a bummer so I made my own. Credit goes to https://github.com/3ximus
https://github.com/3ximus/aerial-sddm-theme
Also here:
https://nixdaily.com/how-to/add-video-background-to-sddm-login-screen/

No hibernate or suspend as I haven't worked out how to do this yet, if you konw please let me know and I will update the theme, if it gets approved for download that is. (*-' )
Not sure if I'm breaking any rules here but all credit goes to their respective authors / owners.

Installation:
Easiest way is throgh your Login Screen sddm manager 'Get New...' button at top right in System Settings. Requires sudo
The not so hard way:
Download atis-sddm.tar.gz extract it somewhere then at the terminal:
sudo cp -r atis-sddm /usr/share/sddm/themes
locate sddm.conf and back it up to sddm.conf.BAK then
sudo <your-favourite-terminal-text-editor> /etc/sddm.conf*
Go to:
[Theme]
Current=atis-sddm <<< change to this.
Save, logout and enjoy. ('-' )

* eos has a weird thing where the file changed depends on whether you have a certain package installed which changes the file and location that governs your sddm settings, for me it's
/etc/sddm.conf.d/kde_settings.conf: symbolic link to /etc/sddm.conf
so ymmv.
If something borks you should be greeted with the Fallback to embedded theme and can revert any chanages made through tty or recovery mode if you have this enabled in grub if your unable to login normally.
As always... caveat emptor.
