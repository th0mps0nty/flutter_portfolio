import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/widgets/custom_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 2,
            width: _screenWidth * 0.9,
            color: Colors.white,
          ),
        ),
        Container(
          height: _screenHeight * 0.05,
          child: Padding(
            padding: EdgeInsets.only(
                left: _screenWidth * 0.05, right: _screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomIconButton(
                        key: GlobalKey(debugLabel: 'launchYoutube'),
                        iconData: FontAwesomeIcons.youtube,
                        url: 'https://youtube.com/th0mps0nty',
                        color: Colors.red),
                    SizedBox(width: _screenWidth * 0.02),
                    CustomIconButton(
                        key: GlobalKey(debugLabel: 'launchGithub'),
                        iconData: FontAwesomeIcons.github,
                        url: 'https://github.com/th0mps0nty',
                        color: Colors.white),
                    SizedBox(width: _screenWidth * 0.02),
                    CustomIconButton(
                        key: GlobalKey(debugLabel: 'launchLinkedin'),
                        iconData: FontAwesomeIcons.linkedin,
                        url: 'https://www.linkedin.com/in/th0mps0nty/',
                        color: Colors.blue),
                  ],
                ),
                Text(
                  'Made with Flutter Web \u00a9 2021',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
