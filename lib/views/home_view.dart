import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/widgets/navigation_arrow.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late double _screenWidth;
  late double _screenHeight;
  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraints) =>
          constraints.maxWidth > 715 ? desktopView() : mobileView(),
    );
  }

  Widget desktopView() {
    return Stack(
      children: <Widget>[
        NavigationArrow(isBackArrow: true),
        NavigationArrow(isBackArrow: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: _screenWidth * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(getFontSize(true)),
                  SizedBox(height: _screenHeight * 0.05),
                  subHeader('Software Developer', getFontSize(false)),
                  SizedBox(height: _screenHeight * 0.01),
                  subHeader('Mobile Application Developer', getFontSize(false)),
                  SizedBox(height: _screenHeight * 0.01),
                  subHeader('Flutter Enthusiast', getFontSize(false)),
                  SizedBox(height: _screenHeight * 0.1),
                ],
              ),
            ),
            SizedBox(width: _screenWidth * 0.03),
            picture()
          ],
        ),
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        picture(),
        SizedBox(
          height: _screenHeight * 0.02,
        ),
        header(30),
        SizedBox(
          height: _screenHeight * 0.02,
        ),
        subHeader(
            'Software Developer - Mobile Application Developer - Flutter Enthusiast',
            15)
      ],
    );
  }

  double getImageSize() {
    return _screenWidth > 1600 && _screenHeight > 800
        ? 400
        : _screenWidth > 1300 && _screenHeight > 600
            ? 350
            : _screenWidth > 1000 && _screenHeight > 400
                ? 300
                : 250;
  }

  double getFontSize(bool isHeader) {
    double fontSize = _screenWidth > 950 && _screenHeight > 550 ? 30 : 25;
    return isHeader ? fontSize * 2.25 : fontSize;
  }

  Widget header(double fontSize) {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontFamily: 'DMSerifDisplay'),
            children: <TextSpan>[
          TextSpan(text: 'Hi, my name is '),
          TextSpan(text: 'Tyler', style: TextStyle(color: Color(0xff21a179))),
          TextSpan(text: '!')
        ]));
  }

  Widget subHeader(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(color: Colors.grey[500], fontSize: fontSize),
    );
  }

  Widget picture() {
    return Container(
      height: getImageSize(),
      width: getImageSize(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getImageSize() / 2),
        child: Image.asset(
          'assets/picture.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
