import 'package:book_tickets/screens/ticket_view.dart';
import 'package:book_tickets/utils/app_info_list.dart';
import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/widgets/ticket_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              const SizedBox(height: 40),
              Text("Tickets", style: Styles.headLineStyle1,),
              const SizedBox(height: 20),
              const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(right: 15),
                child: TicketView(ticket: ticketList[0], isColor: true), // menampilkan tiket pertama
              )
            ],
          ),
        ]
      ),
    );
  }
}
