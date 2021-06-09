import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/utils/tab_controller_handler.dart';
import 'package:flutter_web_portfolio/utils/view_wrapper.dart';
import 'package:flutter_web_portfolio/views/about_view.dart';
import 'package:flutter_web_portfolio/widgets/bottom_bar.dart';
import 'package:flutter_web_portfolio/views/content_view.dart';
import 'package:flutter_web_portfolio/widgets/custom_tab.dart';
import 'package:flutter_web_portfolio/widgets/custom_tab_bar.dart';
import 'package:flutter_web_portfolio/views/home_view.dart';
import 'package:flutter_web_portfolio/views/projects_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late double screenWidth;
  late double screenHeight;
  late double topPadding;
  late double bottomPadding;
  late double sidePadding;
  late TabController tabController;
  // late ItemScrollController itemScrollController;

  List<ContentView> contentViews = [
    ContentView(tab: CustomTab(title: 'Home'), content: HomeView()),
    ContentView(tab: CustomTab(title: 'About'), content: AboutView()),
    ContentView(tab: CustomTab(title: 'Projects'), content: ProjectsView()),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    // itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Color(0xff1e1e24),
      endDrawer: menuDrawer(),
      key: scaffoldKey,
      body: Padding(
          padding: EdgeInsets.only(bottom: bottomPadding, top: topPadding),
          child: ViewWrapper(
            key: GlobalKey(debugLabel: 'ViewWrapper'),
            desktopView: desktopView(),
            mobileView: mobileView(),
          )),
    );
  }

  Widget desktopView() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTabBar(
                controller: tabController,
                tabs: contentViews.map((e) => e.tab).toList()),
            Container(
              height: screenHeight * 0.8,
              child: TabControllerHandler(
                tabController: tabController,
                key: GlobalKey(debugLabel: 'desktopView TabControllerHandler'),
                child: TabBarView(
                  controller: tabController,
                  children: contentViews.map((e) => e.content).toList(),
                  physics: AlwaysScrollableScrollPhysics(),
                ),
              ),
            ),
            BottomBar(),
          ]),
    );
  }

  Widget mobileView() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: Container(
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  iconSize: screenWidth * 0.05,
                  onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                  icon: Icon(Icons.menu_rounded),
                  color: Colors.white),
              Expanded(
                child: ListView.builder(
                    itemCount: contentViews.length,
                    itemBuilder: (context, index) =>
                        contentViews[index].content),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuDrawer() {
    return Drawer(
      child: ListView(
        children: [
              Container(
                height: screenHeight * 0.05,
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
