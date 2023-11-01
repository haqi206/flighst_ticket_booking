import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:book_tickets/widgets/column_layout.dart';
import 'package:book_tickets/widgets/layout_builder_widget.dart';
import 'package:book_tickets/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket; // untuk menampung data tiket dari app_info_list.dart
  final bool? isColor;  // untuk mengecek apakah memerlukan tiket yg tidak berwarna pada halaman tiket
  const TicketView({Key? key, required this.ticket, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = AppLayout.getSize(context); // untuk memanggil class di app_layout.dart

    return SizedBox(
      width: size.width*0.85, // Mengatur lebar dari widget
      height: GetPlatform.isAndroid==true?174:169, // Mengatur tinggi dari widget
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Showing the blue part of the Card:
            Container(
              decoration: BoxDecoration( // untuk memberikan border pada container
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(21), topRight: Radius.circular(21)),
                color: isColor==null? Styles.primaryColor:Colors.white
                // untuk mengecek apabila isColor bernilai null, maka akan menampilkan warna biru pada tiket
                // jika tidak maka akan menampilkan tiket berwarna putih
              ),
              padding: const EdgeInsets.all(16), 
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: isColor == null? Styles.headLineStyle3.copyWith(color: Colors.white): // : -> else
                                                Styles.headLineStyle3
                        // copyWith untuk mengubah style dari text
                      ),
                      const Spacer(), // untuk membuat jarak antar text (sama sprti Expanded(child: Container()))
                      isColor==null?ThickContainer():ThickContainer(isColor: true),
                      Expanded(child: Stack( // untuk menumpuk widget
                        children: [
                          SizedBox( // untuk membuat titik-titik pada tiket
                              height: 24,
                              child: LayoutBuilder(
                                builder: (BuildContext context, BoxConstraints constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate((constraints.constrainWidth()/6).floor(), (index) => SizedBox(
                                        width: 3,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: isColor==null? Colors.white:Colors.grey.shade300,
                                          ),
                                        )
                                    ),
                                    ),
                                  );
                                },
                              )
                          ),
                          Center( // untuk membuat icon pesawat di tengah titik-titik
                              child: Transform.rotate( // Ubah arah dari icon menggunakan Transform.rotate
                                  angle: 1.5,
                                  child: Icon(Icons.local_airport_rounded, color: isColor==null? Colors.white:Color(0xFF8ACCF7))
                              )
                          ),
                        ]
                      ),
                      ),
                      isColor==null?ThickContainer():ThickContainer(isColor: true),
                      const Spacer(),
                      Text(
                        ticket['to']['code'],
                        style: isColor==null? Styles.headLineStyle3.copyWith(color: Colors.white):Styles.headLineStyle3,
                      )
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100, child: Text(
                        ticket['from']['name'],
                        style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4,
                      ),
                      ),
                      Text(ticket['flying_time'], style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white):
                                                                        Styles.headLineStyle4),
                      SizedBox(
                        width: 100, child: Text(
                        ticket['to']['name'],
                        textAlign: TextAlign.end,
                        style: isColor==null?Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4,
                      ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            /// Showing the middle orange part of the Card:
            Container(
              color: isColor==null? Styles.orangeColor:Colors.white,
              child: Row(
                children: [
                   SizedBox( // untuk membuat potongan setengah lingkaran pada tiket
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: isColor==null?Colors.grey.shade200:Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        )
                      ),
                    ),
                  ),
                  const Expanded(child: Padding(
                    padding: EdgeInsets.all(9.0),
                    child: AppLayoutBuilderWidget(section: 6)
                  )),
                   SizedBox( // untuk membuat potongan setengah lingkaran pada tiket
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: isColor==null?Colors.grey.shade200:Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
            /// Showing the bottom orange part of the Card:
            Container(
              decoration:  BoxDecoration( // untuk memberikan border pada container
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isColor==null?21:0),
                      bottomRight: Radius.circular(isColor==null?21:0)
                  ),
                  color: isColor==null?Styles.orangeColor:Colors.white
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(
                          text1: ticket['date'],
                          text2: "Date",
                          alignment: CrossAxisAlignment.start,
                          isColor: false
                      ),
                      AppColumnLayout(
                          text1: ticket['departure_time'],
                          text2: "Departure Time",
                          alignment: CrossAxisAlignment.center,
                          isColor: false
                      ),
                      AppColumnLayout(
                        // karena number bertipe data int di app_info_list, maka harus diubah ke string
                          text1: ticket['number'].toString(),
                          text2: "Number",
                          alignment: CrossAxisAlignment.end,
                          isColor: false
                      ),
                    ]
                  )
                ],
              ),
            )],
        ),
      ),// Mengatur tinggi dari widget
    );
  }
}
