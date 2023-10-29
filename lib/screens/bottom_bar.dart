import 'package:book_tickets/screens/home_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  // Variabel untuk tracking value dari List Widget Halaman
  int _selectedIndex = 0; // Default valuue halaman menjadi homeScreen

  // List Halaman:
  static final List<Widget>_widgetOptions = <Widget>[
    const HomeScreen(),
    const Text('Search'),
    const Text('Tickets'),
    const Text('Profile')
  ];

  // Fungsi untuk mengubah value dari variabel _selectedIndex
  void _onItemTapped(int index) {
    // SetState untuk mengubah UI dari Widget
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex], // Menampilkan Widget Halaman
      ),
      bottomNavigationBar: BottomNavigationBar(

        /// Konfigurasi List Widget Halaman
        currentIndex: _selectedIndex, // Mengatur index dari BottomNavigationBar
        onTap: _onItemTapped, // Mengubah value dari variabel _selectedIndex

        /// Konfigurasi BottomNavigationBar
        elevation: 10, // Mengatur ketebalan shadow
        type: BottomNavigationBarType.fixed, // Mengatur animasi BottomNavigationBar
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xFF526480),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              label: "Tickets"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: "Profile"),
        ],
      ),
    );
  }
}
