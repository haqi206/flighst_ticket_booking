import 'package:book_tickets/screens/ticket_view.dart';
import 'package:book_tickets/utils/app_info_list.dart';
import 'package:book_tickets/widgets/column_layout.dart';
import 'package:book_tickets/widgets/ticket_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../utils/app_styles.dart';
import '../widgets/layout_builder_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              const SizedBox(height: 40),
              Text("Tickets", style: Styles.headLineStyle1.copyWith(fontSize: 36),),
              const SizedBox(height: 40),
              const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
              const SizedBox(height: 40),
              Container(
                padding: EdgeInsets.only(right: 15),
                child: TicketView(ticket: ticketList[0], isColor: true,), // menampilkan tiket pertama
              ),
              const SizedBox(height: 1),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  margin: EdgeInsets.only(left: 16, right: 16),
                  color: Colors.white,
                  child:  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppColumnLayout(text1: "Faris Cuy", text2:"Passenger", alignment: CrossAxisAlignment.start, isColor: true),
                          AppColumnLayout(text1: "5221 476566", text2:"Passport", alignment: CrossAxisAlignment.end, isColor: true),
                        ],
                      ),
                      SizedBox(height: 20),
                      AppLayoutBuilderWidget(section: 15, isColor: false, width: 5),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppColumnLayout(text1: "0055 444 77147", text2:"Number of E-ticket", alignment: CrossAxisAlignment.start, isColor: true),
                          AppColumnLayout(text1: "B2SG2B", text2:"Booking Code", alignment: CrossAxisAlignment.end, isColor: true),
                        ],
                      ),
                      SizedBox(height: 20),
                      AppLayoutBuilderWidget(section: 15, isColor: false, width: 5),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset("images/visa.png", scale: 11),
                                  Text("*** 2462", style: Styles.headLineStyle3)
                                ]
                              ),
                              SizedBox(height: 5),
                              Text("Payment Method", style: Styles.headLineStyle4),
                            ],
                          ),
                          const AppColumnLayout(text1: "\S249.99", text2:"Price", alignment: CrossAxisAlignment.end, isColor: true),
                        ],
                      )
                    ],
                  ),
                ),
              const SizedBox(height: 1), // Barcode
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(21), bottomRight: Radius.circular(21)),
                    color: Colors.white
                ),
                padding: EdgeInsets.only(top: 16, bottom:16),
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: 'https://github.com/haqi206',
                      drawText: false,
                      color: Styles.textColor,
                      width: double.infinity,
                      height: 70,
                      ),
                  ),
                ),
              )
            ],
          ),
        ]
      ),
    );
  }
}
