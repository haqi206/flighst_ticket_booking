import 'package:book_tickets/utils/app_styles.dart';
import 'package:book_tickets/widgets/column_layout.dart';
import 'package:book_tickets/widgets/layout_builder_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 86,
                width: 86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('images/img_1.png')
                  )
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Book Tickets", style: Styles.headLineStyle1),
                  SizedBox(height: 2),
                  Text("New-York", style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500
                  )),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFFFEF4F3)
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF526799)
                          ),
                          child: const Icon(
                              FluentSystemIcons.ic_fluent_shield_filled, color: Colors.white, size: 15),
                        ),
                        SizedBox(width: 5),
                        const Text("Premium Status", style: TextStyle(
                          color: Color(0xFF526799),
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      print("edit tapped");
                    },
                      child: Text(
                          "Edit",
                          style: Styles.textStyle.copyWith(
                              color: Styles.primaryColor,
                              fontWeight: FontWeight.w500
                          )
                      )
                  ),
                ],
              ),

            ],
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey.shade300),
          SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 90,
                width: double.infinity, // untuk mengatur lebar container agar menggunakan hingga batas max lebar layar
                decoration: BoxDecoration(
                  color: Styles.primaryColor,
                  borderRadius: BorderRadius.circular(18)
                ),
              ),
              Positioned(
                right: -45,
                  top: -40,
                  child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF264CD2), width: 18),
                ),
              )
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(FluentSystemIcons.ic_fluent_lightbulb_filament_filled, color: Styles.primaryColor, size: 27),
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You \'ve got a new award",
                          style: Styles.headLineStyle2.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white
                        ),),
                        Text(
                          "You have 12 flights this year",
                          style: Styles.headLineStyle2.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.9), fontSize: 16
                          ),),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 25),
          Text(
            "Accumulated miles",
            style: Styles.headLineStyle2,
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 1,
                  spreadRadius: 1,
                )
              ]
            ),
            child: Column(
              children: [
                SizedBox(height: 15),
                Text(
                  "192802",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    color: Styles.textColor
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Miles Accrued", style: Styles.headLineStyle4.copyWith(fontSize: 16)),
                    Text("7 November 2023", style: Styles.headLineStyle4.copyWith(fontSize: 16)),
                  ],
                ),
                Divider(color: Colors.grey.shade300),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(text1: "23 042", text2: "Miles", alignment: CrossAxisAlignment.start, isColor: false),
                    AppColumnLayout(text1: "Air Asia", text2: "Received from", alignment: CrossAxisAlignment.end, isColor: false),
                  ],
                ),
                SizedBox(height: 12),
                const AppLayoutBuilderWidget(isColor: false, section:12),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(text1: "10 374", text2: "Miles", alignment: CrossAxisAlignment.start, isColor: false),
                    AppColumnLayout(text1: "Batik Air", text2: "Received from", alignment: CrossAxisAlignment.end, isColor: false),
                  ],
                ),
                SizedBox(height: 12),
                const AppLayoutBuilderWidget(isColor: false, section:12),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(text1: "3 865", text2: "Miles", alignment: CrossAxisAlignment.start, isColor: false),
                    AppColumnLayout(text1: "Private Jet", text2: "Received from", alignment: CrossAxisAlignment.end, isColor: false),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SizedBox(height: 25),
          InkWell(
            onTap: () {
              print("how to get more miles tapped");
            },
            child: Center(
              child: Text(
                "How to get more miles?",
                style: Styles.textStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Styles.primaryColor
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
