import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({required this.controller, required this.tabs});

  final TabController controller;
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _tabBarScaling = _screenWidth > 1400
        ? 0.21
        : _screenWidth > 1100
            ? 0.3
            : 0.4;
    return Padding(
      padding: EdgeInsets.only(right: _screenWidth * 0.05),
      child: Container(
        width: _screenWidth * _tabBarScaling,
        child: Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: TabBar(
            controller: controller,
            tabs: tabs,
            indicatorColor: Color(0xff21a179),
          ),
        ),
      ),
    );
  }
}
