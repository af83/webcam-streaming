# Stream webcam and microphone to a rtmp server

## Usage

### vars

* server
* stream

### Example

        <embed src="video.swf"
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
Copyright (c)2010 af83
