import 'package:amazon/utils/color_them.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFieldWidget extends StatefulWidget {
  String title;
  TextEditingController controller;
  bool abscuretext;
  TextFieldWidget(
      {Key? key,
      required this.title,
      required this.controller,
      required this.abscuretext})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode focusnode;
  bool isfocus = true;
  @override
  void initState() {
    super.initState();
    focusnode = FocusNode();
    if (focusnode.hasFocus) {
      isfocus = true;
    } else {
      isfocus = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    focusnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(widget.title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            isfocus
                ? BoxShadow(
                    color: Colors.orange.withOpacity(0.5),
                    blurRadius: 8,
                    spreadRadius: 2)
                : BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2)
          ]),
          child: TextField(
            focusNode: focusnode,
            controller: widget.controller,
            obscureText: widget.abscuretext,
            maxLines: 1,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'enter your ${widget.title}',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                )),
          ),
        )
      ],
    );
  }
}
