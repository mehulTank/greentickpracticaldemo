import 'package:flutter/material.dart';

class AppTextView extends StatelessWidget {
  AppTextView(this.title,
      {Key? key,
      this.textAllCaps = false,
      this.style,
      this.align = TextAlign.start,
      this.overFlow,
      this.maxLine})
      : super(key: key);

  final String? title;
  final TextStyle? style;
  final TextAlign align;
  final TextOverflow? overFlow;
  final maxLine;
  final textAllCaps;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAllCaps?title!.toUpperCase():title ?? "",
      overflow: overFlow,
      style: style,
      textAlign: align,
      maxLines: maxLine,
    );
  }
}
