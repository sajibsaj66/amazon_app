// import 'dart:html';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  Size getScreenSize() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  }

  showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orange,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(content),
        ],
      ),
    ));
  }

  Future<Uint8List?> pickimage() async {
    ImagePicker pick = ImagePicker();
    XFile? file = await pick.pickImage(source: ImageSource.gallery);
    return file!.readAsBytes();
  }

  String getUid() {
    return (1000000 + Random().nextInt(10000)).toString();
  }
}
