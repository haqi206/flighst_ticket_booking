import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class AppColumnLayout extends StatelessWidget {
  final CrossAxisAlignment alignment; // karena column menggunakan crossAxisAlignment
  final String text1;
  final String text2;
  final bool? isColor;
  const AppColumnLayout({Key? key, required this.text1, required this.text2, required this.alignment, this.isColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(text1, style: isColor==null?Styles.headLineStyle3.copyWith(color: Colors.white): Styles.headLineStyle3),
        const SizedBox(height: 5),
        Text(text2, style: isColor==null?Styles.headLineStyle4.copyWith(color: Colors.white): Styles.headLineStyle4)
      ],
    );
  }
}
