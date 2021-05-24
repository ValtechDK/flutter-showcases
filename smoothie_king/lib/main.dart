import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smoothie_king/Constants.dart';
import 'package:smoothie_king/menu_button.dart';
import 'package:smoothie_king/side_menu_dynamic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final pageController = PageController(initialPage: 0)..addListener(() {});
  CurvedAnimation curve;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        PageView(
          onPageChanged: (page) {},
          scrollDirection: Axis.horizontal,
          controller: pageController,
          children: [
            PageContent(
              title: "Shake",
              colors: Constants.shakeColors,
            ),
            PageContent(
              title: "Drinks",
              colors: Constants.drinksColors,
            ),
            PageContent(
              title: "Coffee",
              colors: Constants.coffeeColors,
            ),
            PageContent(
              title: "Cocktail",
              colors: Constants.cocktailsColors,
            ),
          ],
        ),
        SideMenu(
          onMenuItemClick: (selectedItemIndex) {
            pageController.animateToPage(selectedItemIndex,
                curve: Curves.easeInOutBack,
                duration: Duration(milliseconds: 1500));
          },
          controller: controller,
          curve: curve,
        ),
      ]),
    );
  }

  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeInOutBack);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class SideMenu extends StatefulWidget {
  final Function(int) onMenuItemClick;
  final CurvedAnimation curve;
  final AnimationController controller;

  // final int selectedItemIndex;

  const SideMenu({
    Key key,
    this.onMenuItemClick,
    this.curve,
    this.controller,
    // this.selectedItemIndex,
  }) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState(
        this.onMenuItemClick,
        this.curve,
        this.controller,
        // this.selectedItemIndex,
      );
}

class _SideMenuState extends State<SideMenu>
    with SingleTickerProviderStateMixin {
  final Function(int) onMenuItemClick;
  final CurvedAnimation curve;
  final AnimationController controller;

  final int numberOfElements = 4;
  int currentItemIndex = 0;

  Offset targetItemPoint;
  Offset currentMidPoint;

  List<double> items = List.filled(4, 0);

  double generalItemX;

  _SideMenuState(this.onMenuItemClick, this.curve, this.controller);

  @override
  Widget build(BuildContext context) {
    final parent = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (currentMidPoint == null) {
        double heightForEachItem = constraints.maxHeight / numberOfElements;

        currentMidPoint = Offset(
          constraints.maxWidth,
          (.5 + currentItemIndex) * heightForEachItem,
        );

        generalItemX = constraints.maxWidth / 2;

        items[0] = (.5 + 0) * heightForEachItem;
        items[1] = (.5 + 1) * heightForEachItem;
        items[2] = (.5 + 2) * heightForEachItem;
        items[3] = (.5 + 3) * heightForEachItem;

        debugPrint(
            "height: ${constraints.maxHeight}, heightForEachItem: $heightForEachItem");
      }

      return CustomPaint(
          painter: DynamicSideMenuPainter(
            mainPoint: Point(currentMidPoint.dx, currentMidPoint.dy),
            fillColor: Constants.mainBackgroundColor,
            dotColor: Constants.dotColor,
          ),
          willChange: true,
          child: RotatedBox(
            quarterTurns: 3,
            child: Container(
              height: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: MenuItem(
                      title: "Cocktail",
                      isSelected: currentItemIndex == 3,
                      onClick: () {
                        animatePoint(3);
                      },
                    ),
                  ),
                  Expanded(
                    child: MenuItem(
                      title: "Coffee",
                      isSelected: currentItemIndex == 2,
                      onClick: () {
                        animatePoint(2);
                      },
                    ),
                  ),
                  Expanded(
                    child: MenuItem(
                      title: "Drinks",
                      isSelected: currentItemIndex == 1,
                      onClick: () {
                        animatePoint(1);
                      },
                    ),
                  ),
                  Expanded(
                    child: MenuItem(
                      title: "Shake",
                      isSelected: currentItemIndex == 0,
                      onClick: () {
                        animatePoint(0);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ));
    });

    return Container(
      height: double.infinity,
      width: 64,
      child: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16),
                color: Constants.mainBackgroundColor,
                width: double.infinity,
                alignment: Alignment.center,
                child: MenuButton(
                  width: 20,
                  height: 30,
                ),
              ),
              SizedBox(
                height: 160,
                child: Container(
                  color: Constants.mainBackgroundColor,
                ),
              ),
              Expanded(
                child: Container(
                  child: parent,
                ),
              ),
              SizedBox(
                height: 130,
                child: Container(
                  color: Constants.mainBackgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void animatePoint(int selectedItemIndex) {
    if (selectedItemIndex == currentItemIndex) {
      return;
    }

    this.onMenuItemClick(selectedItemIndex);

    controller.stop(canceled: true);
    controller.reset();

    currentMidPoint = Offset(currentMidPoint.dx, items[currentItemIndex]);
    targetItemPoint = Offset(currentMidPoint.dx, items[selectedItemIndex]);

    final animation =
        Tween<Offset>(begin: currentMidPoint, end: targetItemPoint)
            .animate(curve);
    animation.addListener(() {
      setState(() {
        currentMidPoint = animation.value;
      });
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        currentItemIndex = selectedItemIndex;
      }
    });

    controller.forward();
  }
}

class PageContent extends StatelessWidget {
  final String title;
  final List colors;

  const PageContent({Key key, this.title, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 100, left: 30 + 64.0, right: 30, bottom: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ContentItem(
                  title: title,
                  color: colors[0],
                ),
                ContentItem(
                  title: title,
                  color: colors[1],
                ),
                ContentItem(
                  title: title,
                  color: colors[2],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContentItem extends StatelessWidget {
  const ContentItem({
    Key key,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Container(
        width: double.infinity,
        height: 250,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text(
            '$title #1',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onClick;

  const MenuItem(
      {Key key,
      @required this.title,
      @required this.onClick,
      @required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fontWeight = FontWeight.normal;

    if (isSelected) {
      fontWeight = FontWeight.bold;
    }

    return InkWell(
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: 16,
            letterSpacing: 0.7,
            color: Colors.white,
          ),
        ),
      ),
      onTap: onClick,
    );
  }
}
