import 'package:flutter/material.dart';
import 'package:widget_app/colors/hexColor.dart';
import 'package:widget_app/main.dart';
import 'package:widget_app/screen/homeScreen.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key, required});
  @override
  State<MyNavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    SubView(),
    SubView(),
    SubView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      )),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bento_sharp), label: "WIDGET"),
            BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken_outlined), label: "MY WIDGET"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "SETTING",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: HexColor.gray80,
          iconSize: 30,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          onTap: _onItemTapped,
          elevation: 0,
          backgroundColor: HexColor.bgDark),
    );
  }
}
