
import 'package:examscreens/constant/custom_text.dart';
import 'package:flutter/material.dart';

class AppInputText extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? title;
  final bool? enable;
  const AppInputText({this.title, this.controller, this.hint, this.enable});

  @override
  _AppInputTextState createState() => _AppInputTextState();
}

class _AppInputTextState extends State<AppInputText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: widget.title!,
          color: Colors.black,
          size: 15,
          textAlign: TextAlign.start,
        ),
        TextFormField(
          //enabled: widget.enable,
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: widget.hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ),
      ],
    );
  }
}