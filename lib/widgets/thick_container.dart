import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThickContainer extends StatelessWidget {
  final bool? isColor; // untuk menentukan warna tiket apakah untuk home atau untuk ticket screen
  const ThickContainer({Key? key, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration( // untuk membuat lingkaran pada tiket
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isColor == null? Colors.white: const Color(0xFF8ACCF7),
          width: 2.5,
        ),
      ),
    );
  }
}
