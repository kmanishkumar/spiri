import 'package:flutter/material.dart';
import 'package:spiri/features/splash/repo/splash.repo.dart';
import 'package:spiri/res/constant.dart';
import 'package:supercharged/supercharged.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(100.milliseconds, () {
      SplashRepo.checkLogin(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(splash_logo),
        ));
  }
}
