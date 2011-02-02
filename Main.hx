/* ************************************************************************ */
/*                                                                          */
/*  haXe Video                                                              */
/*  Copyright (c)2007 Nicolas Cannasse                                      */
/*  Copyright (c)2011 af83                                                  */
/*                                                                          */
/* This library is free software; you can redistribute it and/or            */
/* modify it under the terms of the GNU Lesser General Public               */
/* License as published by the Free Software Foundation; either             */
/* version 2.1 of the License, or (at your option) any later version.       */
/*                                                                          */
/* This library is distributed in the hope that it will be useful,          */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of           */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU        */
/* Lesser General Public License or the LICENSE file for more details.      */
/*                                                                          */
/* ************************************************************************ */

class Main {
    static var trace : flash.text.TextField;
    static var bpos : Float = 2;
    static var webcam : Webcam;

    static function initTrace() {
        var mc = flash.Lib.current;
        trace = new flash.text.TextField();
        trace.y = 20;
        trace.thickness = 2;
        trace.width = mc.stage.stageWidth;
        trace.height = mc.stage.stageHeight - 20;
        trace.selectable = false;
        trace.textColor = 0xFFFFFF;
        trace.mouseEnabled = false;
        trace.filters = [new flash.filters.GlowFilter(0x7F7F7F,90,2,2,10)];
    }

    static function doTrace( v : Dynamic, ?pos : haxe.PosInfos ) {
        trace.text += pos.fileName+"("+pos.lineNumber+") : "+Std.string(v)+"\n";
        flash.Lib.current.addChild(trace);
    }

    static function main() {
        initTrace();
        haxe.Log.trace = doTrace;

        flash.Lib.current.addEventListener(flash.events.Event.ADDED_TO_STAGE, on_added);
    }

    static function get_param(name, defaultValue) {
        var prop = Reflect.field(flash.Lib.current.loaderInfo.parameters, name);
        if (prop == 0)
            return defaultValue;
        return prop;
    }

    static function on_added (_) {
        var server = flash.Lib.current.loaderInfo.parameters.server;
        var stream = flash.Lib.current.loaderInfo.parameters.stream;
        var token  = flash.Lib.current.loaderInfo.parameters.token;

        var camerawidth  = get_param("camerawidth", 640);
        var cameraheight  = get_param("cameraheight", 480);
        var camerafps  = get_param("camerafps", 15);

        flash.net.NetConnection.defaultObjectEncoding = flash.net.ObjectEncoding.DEFAULT;

        try {
            webcam = new Webcam(server, stream, "live", token, camerawidth, cameraheight, camerafps);
            var cam = webcam.getCam();
            var video = new flash.media.Video(camerawidth, cameraheight);
            video.x = 0;
            video.y = 0;
            video.attachCamera(cam);
            flash.Lib.current.addChild(video);
        } catch (e: String) {
             var trace = new flash.text.TextField();
             trace.y = 20;
             trace.thickness = 2;
             trace.selectable = false;
             trace.textColor = 0x0000000;
             trace.mouseEnabled = false;
             trace.text = e;
             flash.Lib.current.addChild(trace);
        }
    }
}
