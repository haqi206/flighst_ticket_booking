import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:book_tickets/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket; // untuk menampung data tiket dari app_info_list.dart
  const TicketView({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = AppLayout.getSize(context); // untuk memanggil class di app_layout.dart

    return SizedBox(
      width: size.width*0.85, // Mengatur lebar dari widget
      height: 200, // Mengatur tinggi dari widget
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            /// Showing the blue part of the Card:
            Container(
              decoration: BoxDecoration( // untuk memberikan border pada container
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(21), topRight: Radius.circular(21)),
                color: Styles.primaryColor
              ),
              padding: const EdgeInsets.all(16), 
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: Styles.headLineStyle3.copyWith(color: Colors.white),
                        // copyWith untuk mengubah style dari text
                      ),
                      const Spacer(), // untuk membuat jarak antar text (sama sprti Expanded(child: Container()))
                      ThickContainer(),
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
                                            color: Colors.white,
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
                                  child: Icon(Icons.local_airport_rounded, color: Colors.white)
                              )
                          ),
                        ]
                      ),
                      ),
                      ThickContainer(),
                      const Spacer(),
                      Text(
                        ticket['to']['code'],
                        style: Styles.headLineStyle3.copyWith(color: Colors.white),
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
                        style: Styles.headLineStyle4.copyWith(color: Colors.white),
                      ),
                      ),
                      Text(ticket['flying_time'], style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                      SizedBox(
                        width: 100, child: Text(
                        ticket['to']['name'],
                        textAlign: TextAlign.end,
                        style: Styles.headLineStyle4.copyWith(color: Colors.white),
                      ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            /// Showing the middle orange part of the Card:
            Container(
              color: Styles.orangeColor,
              child: Row(
                children: [
                  const SizedBox( // untuk membuat potongan setengah lingkaran pada tiket
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        )
                      ),
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: LayoutBuilder( // untuk membuat titik-titik pada tiket
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                              width: 5, height: 1,
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  )
                              )
                          )),
                        );
                      },
                    ),
                  )),
                  const SizedBox( // untuk membuat potongan setengah lingkaran pada tiket
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(21), bottomRight: Radius.circular(21)),
                  color: Styles.orangeColor
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket['date'],
                            style: Styles.headLineStyle3.copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Date",
                            style: Styles.headLineStyle4.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            ticket['departure_time'],
                            style: Styles.headLineStyle3.copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Departure Time",
                            style: Styles.headLineStyle4.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            // karena number bertipe data int di app_info_list, maka harus diubah ke string
                            ticket['number'].toString(),
                            style: Styles.headLineStyle3.copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Number",
                            style: Styles.headLineStyle4.copyWith(color: Colors.white),
                          )
                        ],
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
