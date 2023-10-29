import 'package:book_tickets/utils/app_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic> hotel; // untuk menampung data hotel dari app_info_list.dart

  // Before memakai list -> const HotelScreen({super.key});
  const HotelScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('untuk mengecek data hotel: ${hotel['place']}');
    final size = AppLayout.getSize(context); // untuk mendapatkan ukuran layar
    return Container(
      width: size.width*0.6,
      height: 350,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [ // untuk memberikan shadow pada container
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 20,
            spreadRadius: 5,
          )
        ],
        color: Styles.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container( // container untuk gambar
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Styles.primaryColor,
              image: DecorationImage(
                fit: BoxFit.cover, // untuk mengatur ukuran gambar
                image: AssetImage(
                    "images/${hotel['image']}"
                ),
              )
            )
          ),
          SizedBox(height: 10),
          Text(
            hotel['place'],
            style: Styles.headLineStyle2.copyWith(color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            hotel['destination'],
            style: Styles.headLineStyle3.copyWith(color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            "\$${hotel['price']}/night",
            style: Styles.headLineStyle1.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
