import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/about_view.dart';
import 'package:flutter_web_portfolio/bottom_bar.dart';
import 'package:flutter_web_portfolio/content_view.dart';
import 'package:flutter_web_portfolio/custom_tab.dart';
import 'package:flutter_web_portfolio/custom_tab_bar.dart';
import 'package:flutter_web_portfolio/home_view.dart';
import 'package:flutter_web_portfolio/projects_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late double _screenWidth;
  late double _screenHeight;
  late double _topPadding;
  late double _bottomPadding;
  late TabController _tabController;

  List<ContentView> contentViews = [
    ContentView(tab: CustomTab(title: 'Home'), content: HomeView()),
    ContentView(tab: CustomTab(title: 'About'), content: AboutView()),
    ContentView(tab: CustomTab(title: 'Projects'), content: ProjectsView()),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: contentViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _topPadding = _screenHeight * 0.05;
    _bottomPadding = _screenHeight * 0.01;

    return Scaffold(
      backgroundColor: Color(0xff1e1e24),
      endDrawer: menuDrawer(),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(bottom: _bottomPadding, top: _topPadding),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 715) {
              return desktopView();
            } else {
              return mobileView();
            }
          },
        ),
      ),
    );
  }

  Widget desktopView() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTabBar(
              controller: _tabController,
              tabs: contentViews.map((e) => e.tab).toList()),
          Container(
            height: _screenHeight * 0.8,
            child: TabBarView(
              controller: _tabController,
              children: contentViews.map((e) => e.content).toList(),
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
          BottomBar(),
        ]);
  }

  Widget mobileView() {
    return Padding(
      padding: EdgeInsets.only(
          left: _screenWidth * 0.05, right: _screenWidth * 0.05),
      child: Container(
        width: _screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                iconSize: _screenWidth * 0.05,
                onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                icon: Icon(Icons.menu_rounded),
                color: Colors.white),
            Expanded(
              child: ListView.builder(
                  itemCount: contentViews.length,
                  itemBuilder: (context, index) => contentViews[index].content),
            )
          ],
        ),
      ),
    );
  }

  Widget menuDrawer() {
    return Drawer(
      child: ListView(
        children: [
              Container(
                height: _screenHeight * 0.05,
              )
            ] +
            contentViews
                .map((e) => Container(
                      child: ListTile(title: Text(e.tab.title), onTap: () {}),
                    ))
                .toList(),
      ),
    );
  }
}
