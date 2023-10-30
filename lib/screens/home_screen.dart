import 'package:book_tickets/screens/hotel_screen.dart';
import 'package:book_tickets/screens/ticket_view.dart';
import 'package:book_tickets/utils/app_info_list.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

import '../widgets/double_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 40),
                // const Gap(40), // Memberikan jarak vertical antar widget
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Memberikan jarak antar widget
                    children: [
                     Column( // Column untuk text Good Morning dan Book Tickets
                      crossAxisAlignment: CrossAxisAlignment.start, // Mengatur posisi text
                      children: [
                        Text(
                          "Good Morning",
                          style: Styles.headLineStyle3
                        ),
                        SizedBox(height: 5),
                        // const Gap(5), // Memberikan jarak vertical antar 2 text
                        Text(
                          "Book Tickets",
                          style: Styles.headLineStyle1
                        ),
                      ],
                    ),
                    Container( // container untuk gambar img_1.png
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage (
                          fit: BoxFit.fitHeight, // Mengatur ukuran gambar
                          image: AssetImage('images/img_1.png')
                        )
                      ),
                    )
                  ]
                ),
                SizedBox(height: 25),
                // const Gap(25), // Memberikan jarak vertical antar widget
                Container(
                  decoration: BoxDecoration( // Memberikan border pada container (background pada kolom search)
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), // jarak dan size dari kolom search
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_regular, color: Color(0xFFBFC205)),
                      Text(
                        "Search",
                        style: Styles.headLineStyle4,
                      )
                    ],
                  ),
                ),
               SizedBox(height: 40),
               // const Gap(40),
                const AppDoubleTextWidget(text1: "Upcoming Flights", text2: "View all"),
              ],
            ),
          ),
          SizedBox(height: 15),
          // const Gap(15),
          SingleChildScrollView( // untuk membuat ticket view dapat di scroll
            scrollDirection: Axis.horizontal, // Mengatur arah scroll
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: ticketList.map((e) => TicketView(ticket: e)).toList() // untuk membuat list dari ticket,
              // kenapa toList() karena Row tidak menampung map sehingga harus diubah menjadi list
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  const AppDoubleTextWidget(text1: "Hotels", text2: "View all"),
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: hotelList.map((e) => HotelScreen(hotel: e)).toList() // untuk membuat list dari hotel
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
