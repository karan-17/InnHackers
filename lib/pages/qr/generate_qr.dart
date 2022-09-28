import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../dbHelper/constants.dart';


class GenerateQR extends StatefulWidget {
  const GenerateQR({Key? key}) : super(key: key);

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  final GlobalKey genKey = GlobalKey();
  Future<void> takePicture() async {
    RenderRepaintBoundary boundary = genKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    File imgFile = new File('images/codes/qr.png');
    imgFile.writeAsBytes(pngBytes);
  }
  String data = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RepaintBoundary(
            key: genKey,
            child: QrImage(
              data: data,
              backgroundColor: Colors.white,
              version: QrVersions.auto,
              size: 300.0,
            ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: 300.0,
            child: TextField(
              //we will generate a new qr code when the input value change
              onChanged: (value) {
                setState(() {
                  data = value;
                });
              },
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "Type the Data",
                filled: true,
                fillColor: AppStyle.textInputColor,
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          RawMaterialButton(
            onPressed: () {
            takePicture();
            },
            fillColor: AppStyle.accentColor,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(
              horizontal: 36.0,
              vertical: 16.0,
            ),
            child: const Text(
              "Generate QR Code",
            ),
          )
        ],
      ),
    );
  }

}