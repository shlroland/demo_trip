import 'package:demo_trip/pages/home_page.dart';
import 'package:demo_trip/pages/my_page.dart';
import 'package:demo_trip/pages/search_page.dart';
import 'package:demo_trip/pages/travel_page.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage()
        ],
      ),
    );
  }
}
