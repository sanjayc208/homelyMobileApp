import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:homely_mobile_app/utils/custom_colors.dart';

/// This is the stateful widget that the main application instantiates.
class FooterNavBar extends StatefulWidget {
  const FooterNavBar({Key? key}) : super(key: key);

  @override
  State<FooterNavBar> createState() => _FooterNavBarState();
}

/// This is the private State class that goes with FooterNavBar.
class _FooterNavBarState extends State<FooterNavBar> {
  int _selectedIndex = 0;
  bool onSelected = false;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: CustomColors.firebaseGrey,
      buttonBackgroundColor: Colors.red,
      color: Colors.white,
      height: 60.0,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 400),
      items: <Widget>[
        Icon(Icons.add, size: 30, color: _selectedIndex == 0 ? Colors.white : Colors.black),
        Icon(Icons.list, size: 30, color: _selectedIndex == 1 ? Colors.white : Colors.black),
        Icon(Icons.compare_arrows, size: 30, color: _selectedIndex == 2 ? Colors.white : Colors.black),
      ],
        onTap: (index) => _onItemTapped(index),
        shadow: 1.0
    );
  }
}
