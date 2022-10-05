import 'package:flutter/material.dart';
import 'package:i_can/screens/home_screen.dart';
import 'package:i_can/screens/settings.dart';
import 'package:i_can/screens/share_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 36;
  double bottomBarBorderWidth = 1;

  List<Widget> pages = [
    const HomeScreen(),
    const ShareScreen(),
    const Settings(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_page],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _page,
            selectedItemColor: Colors.white,
            elevation: 0,
            backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
            iconSize: 24,
            onTap: updatePage,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.share),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              ),
            ]));
  }
}
