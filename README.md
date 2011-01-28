# Stream webcam and microphone to a rtmp server

## Usage

### FlashVars

* server : rtmp server
* stream : rtmp stream to publish
* token

### Example

Raw HTML:

        <embed src="webcam.swf"
               flashvars="server=rtmp://localhost/live&stream=plop"
               bgcolor="#ffffff"
               width="500"
               height="500"
               name="haxe"
               quality="high"
               align="middle"
               allowScriptAccess="always"
               type="application/x-shockwave-flash"
               pluginspage="http://www.macromedia.com/go/getflashplayer" />

With SwfObject:

        var flashvars = {server : "rtmp://localhost/live",
                         stream : "plop"};
        var params = {};
        var attributes = {};
        swfobject.embedSWF("webcam.swf", "myId", "300", "120", "9.0.0","expressInstall.swf", flashvars, params, attributes);


## Compile

        # debug version
        make debug

        # release version
        make release

## License

LGPL 2.1

## Credits

Original code haXe Video by Nicolas Cannasse

Copyright (c)2007 Nicolas Cannasse
Copyright (c)2011 af83
