import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class AppDoubleTextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const AppDoubleTextWidget({Key? key, required this.text1, required this.text2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: Styles.headLineStyle2,
          ),
          InkWell(
            child: Text(
              text2,
              style: Styles.textStyle.copyWith(color: Styles.primaryColor),
            ),
          )
        ],
    );
  }
}
