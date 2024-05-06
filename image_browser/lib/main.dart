import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_browser/animated/custom_animation.dart';
import 'package:image_browser/page_image_manager/image_browser_page.dart';
import 'package:image_browser/page_image_manager/image_search_page.dart';
import 'package:image_browser/main_page.dart';
import 'package:image_browser/utils/event_bus_utils.dart';

void main() {
  EasyLoading.init();

  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey(); //重新生成key导致控件重新build
    });
  }

  @override
  void initState() {
    super.initState();
    eventBus.on<EventReselectImageUrl>().listen((event) {
      restartApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: MaterialApp(
        title: 'ImageBrowser',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/ImageSearchPage': (context) => ImageSearchPage(),
        },
        home: MainPage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

