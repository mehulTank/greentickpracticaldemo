
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greentickpracticaldemo/ui/router/app_router.dart';
import 'package:greentickpracticaldemo/ui/widget/app_circle_image.dart';
import 'package:greentickpracticaldemo/utils/colors.dart';
import 'package:greentickpracticaldemo/utils/constants/app_constant.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handleNavigation();
  }

  void handleNavigation() async {

     Timer(Duration(seconds: 5), () {
     Navigator.pushReplacementNamed(context, AppRouterPath.home);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorBg,
      child: Center(
        child: AppImageView(
          url: AppConst.assets.imgAppLogo,
          height: 80,
          width: 80,
        ),
      ),
    );
  }
}
