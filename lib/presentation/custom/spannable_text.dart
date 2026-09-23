import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SpannableTextView extends StatelessWidget {
  final Map<String, bool> stringMap;
  final bool isBold;
  final bool isUnderline;
  final Color colorSpannable, color;
  final Function(String) onClick;
  final double fontSize;
  final TextAlign align;

  const SpannableTextView(
      {super.key,
      required this.stringMap,
      required this.onClick,
      this.fontSize = 16.0,
      this.align = TextAlign.center,
      this.isBold = false,
      this.color = Colors.black,
      this.colorSpannable = Colors.black,
      this.isUnderline = false});

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpanList = [];

    stringMap.forEach((text, isSpannable) {
      textSpanList.add(TextSpan(
        style: TextStyle(
            color: isSpannable ? colorSpannable : color,
            fontSize: fontSize,
            decoration:
                isSpannable && isUnderline ? TextDecoration.underline : null,
            fontWeight: isSpannable && isBold ? FontWeight.bold : null),
        text: text,
        recognizer: TapGestureRecognizer()
          ..onTap = () => isSpannable ? onClick(text) : null,
      ));
    });

    return RichText(
      textAlign: align,
      text: TextSpan(children: textSpanList),
    );
  }
}