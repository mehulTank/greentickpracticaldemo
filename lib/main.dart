import 'dart:async';
import 'package:flutter/material.dart';
import 'package:greentickpracticaldemo/service/service_locator.dart';
import 'package:greentickpracticaldemo/ui/router/app_router.dart';
import 'package:greentickpracticaldemo/utils/app_fonts.dart';
import 'package:greentickpracticaldemo/utils/colors.dart';



void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  static bool isLogoutDisplayed = false;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<StreamSubscription> _subscriptions = [];

  final TAG = 'Application';

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greentick',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        fontFamily: AppFonts.rubik,
        accentColor: AppColor.color243B77,
        primaryColor: AppColor.color243B77,
        //primarySwatch: Palette.mainDark,
      ),
      onGenerateRoute: locator<AppRouter>().onGenerateRoute,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
