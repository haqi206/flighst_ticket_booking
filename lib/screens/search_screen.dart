import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:book_tickets/widgets/double_text_widget.dart';
import 'package:book_tickets/widgets/icon_text_widget.dart';
import 'package:book_tickets/widgets/ticket_tabs.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(height: 40), // Memberikan jarak vertical antar widget
          Text(
            "What are\nyou looking for?",
            style: Styles.headLineStyle1.copyWith(fontSize: 35),
          ),
          SizedBox(height: 20),
          const AppTicketTabs(firstTab: "Airline Tickets", secondTab: "Hotels"),
          SizedBox(height: 25),
          const IconTextWidget(icon: Icons.flight_takeoff_rounded, text: 'Departure'),
          SizedBox(height: 20),
          const IconTextWidget(icon: Icons.flight_land_rounded, text: 'Arrival'),
          SizedBox(height: 25),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xD91130CE),
            ),
            child: Center(
                child: Text(
                    "Find Tickets",
                    style: Styles.textStyle.copyWith(color: Colors.white)
                )
            ),
          ),
          SizedBox(height: 40),
          AppDoubleTextWidget(text1: "News", text2: "View all"),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 425,
                width: size.width * 0.42,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 2,
                          blurRadius: 5,
                      )
                    ],
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/sit.jpg')
                          )
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                        "20% Discount on the early booking of this flight. "
                            "Don't miss out this opportunity.",
                        style: Styles.headLineStyle3
                    ),
                  ]
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width * 0.44,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Color(0xFF3AB8B8),
                            borderRadius: BorderRadius.circular(18)
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Discount\nfor survey", style: Styles.headLineStyle2.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text("Take the survey about our services and get discount",
                                style: Styles.headLineStyle2.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18
                                )
                            ),
                          ],
                        ),
                      ),
                      Positioned( // untuk memposisikan widget lingkaran pada card
                          right: -45,
                          top: -40,
                          child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF189999), width: 18),
                            color: Colors.transparent
                        ),
                      )
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: size.width * 0.44,
                    height: 210,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFFEC6545),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Visit\nNetherlands",
                          style: Styles.headLineStyle3.copyWith(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        RichText(text:  TextSpan(
                            text: "Book your tickets to Netherlands and get 20% discount",
                            style: Styles.headLineStyle2.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                            )
                        ))
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
