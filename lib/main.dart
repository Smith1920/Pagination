// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial/features/pagination/cubit/cubit.dart';
import 'package:tutorial/features/pagination/cubit/cubit_state.dart';
import 'package:tutorial/pagination.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PaginationCubit(PaginationInitial()),
          )
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorialCoachMark Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomPagination(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late TutorialCoachMark tutorialCoachMark;

  GlobalKey keyButton = GlobalKey();
  GlobalKey keyButton1 = GlobalKey();
  GlobalKey keyButton2 = GlobalKey();
  GlobalKey keyButton3 = GlobalKey();
  GlobalKey keyButton4 = GlobalKey();
  GlobalKey keyButton5 = GlobalKey();
  GlobalKey keyButton6 = GlobalKey();

  GlobalKey keyBottomNavigation1 = GlobalKey();
  GlobalKey keyBottomNavigation2 = GlobalKey();
  GlobalKey keyBottomNavigation3 = GlobalKey();
  final controller = ScrollController();

  @override
  void initState() {
    createTutorial();
    Future.delayed(Duration.zero, showTutorial);
    super.initState();
  }

  void _scrollTo() {
    controller.animateTo(700,
        duration: const Duration(seconds: 1), curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            // key: keyButton1,
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          PopupMenuButton(
            key: keyButton1,
            icon: const Icon(Icons.view_list, color: Colors.white),
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Is this"),
              ),
              const PopupMenuItem(
                child: Text("What"),
              ),
              const PopupMenuItem(
                child: Text("You Want?"),
              ),
            ],
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          controller: controller,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Final Stage..'),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text('$width'),
              ),
            ),
            Card(
              child: Padding(
                key: keyButton6,
                padding: const EdgeInsets.all(15),
                child: Text('$height'),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Center(
                  child: SizedBox(
                    key: keyBottomNavigation1,
                    height: 40,
                    width: 40,
                  ),
                )),
                Expanded(
                    child: Center(
                  child: SizedBox(
                    key: keyBottomNavigation2,
                    height: 40,
                    width: 40,
                  ),
                )),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      key: keyBottomNavigation3,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            // currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {},
          ),
        ],
      ),
    );
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Colors.red,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 12),
      onFinish: () {
        print("finish");
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        if (target.keyTarget == keyBottomNavigation3) {
          _scrollTo();
        }

        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: keyBottomNavigation1,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Hello, How you doin?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'What\'s your name?',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation2",
        keyTarget: keyBottomNavigation2,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation3",
        keyTarget: keyBottomNavigation3,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _scrollTo();
                      },
                      child: const Text('Check'))
                ],
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyButton6",
        keyTarget: keyButton6,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    return targets;
  }
}
