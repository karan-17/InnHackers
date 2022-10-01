import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class Utils{
  static capture(GlobalKey key)async{
    if(key==null) return null;
RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final ui.Image image= await boundary.toImage(pixelRatio: 3.0);
      final  ByteData byteData = image.toByteData(format: ui.ImageByteFormat.png) as ByteData;
      final Uint8List pngBytes = byteData.buffer.asUint8List();
      return pngBytes;
    }
}