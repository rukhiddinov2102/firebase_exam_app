import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final double? borderRadiuss;
  final Color? backgraoundColors;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onTap;
  final double? width, height;
  const AppButton(
      {this.text,
      this.fontSize,
      this.textColor,
      this.backgraoundColors,
      this.onTap,
      this.fontWeight,
      this.borderRadiuss,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(50, 50),
              primary: backgraoundColors,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiuss!))),
          onPressed: onTap,
          child: Text(
            text!,
            style: TextStyle(color: textColor, fontSize: fontSize),
          )),
    );
  }
}

// /**GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.8,
//         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//             color: bgColor, borderRadius: BorderRadius.circular(borderRadius!)),
//         child: Text(
//           text!,
//           textAlign: TextAlign.center,
//           style: TextStyle(color: textColor, fontSize: fontSize),
//         ),
//       ),
//     ); */

class AppText extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? textAlign;
  const AppText(
      {this.text, this.color, this.size, this.weight, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }
}
