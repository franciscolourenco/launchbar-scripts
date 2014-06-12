My [Launchbar](http://www.obdev.at/products/launchbar/index.html) Scripts
=====================

Favorite
-----------
* **imgur** - Upload given image(s) to [imgur.com](http://imgur.com/) and returns the direct link. If no image is provided, it enters screenshot mode.
* **Pastebin** - Paste given text into [ix.io](http://ix.io/). Also supports text files.
* **Mail Page** - Creates a new email in Sparrow.app with the active Chrome page title in the subject and url in the body. The focus is left in the address field for the email to be typed with autocompletion.
* **Share Dropbox** - Pass it a file or a folder and get a dropbox public url. If you don't pass anything it will share a screenshot instead. You can specify the name of the screenshot by pressing space instead of return.
* **Timer** - Enter a time interval followed by an optional message i.e. "15m6s pizza" and receive an alert after the time has passed.
* **Short goo.gl** - Shorten a url with goo.gl.
* **Show IP External Address** - Find out the ip address you are using on the internet.
* **Toggle Function Keys** - Toggles the function keys between F1,F2,F3... and Brightness,Media,Volume...
* **Toggle Audio Output** - Used to Toggle between default audio output and bluetooth wireless connected to my hi-fi.


Other
---------

* **Haste** - Paste text into hastebin.com (I don't use this anyome because the site requires javascript and many noscript users complain)
* **Chat** - Enter the name of a contact and a chat window will open in Adium
* **Short tinyarrow.ws** - Shorten a url with tinyarrow.ws url shortener.
* **~~Color Picker~~** - ~~Instead just save an applescript containing `choose color` as **Color Picker.app**. With [Hex Color Picker](http://wafflesoftware.net/hexpicker/) it becomes a better alternative to **DigitalColor Meter.app**.~~ Now I just use the standard DigitalColor Meter.app and use ⌘C to copy the color value as text.
* **Mount Media** - used to mount a specific firewire drive.


Installing
-----------
Copy the scripts to `~/Library/Application Support/Launchbar/Actions` and they will be available as actions in launchbar as soon as they get indexed.

__You need to edit the dropbox id inside the script Share Dropbox.applescript for it to work. You can find the id by looking at the url of one of yout public files i.e. "http://dl.getdropbox.com/u/4204196/example.png"__
