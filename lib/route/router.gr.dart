// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/login/login.dart';
import '../features/otp/otpPage.dart';
import '../features/splash/spash.dart';

class Routes {
  static const String splashPage = '/';
  static const String loginPage = '/login-page';
  static const String otp = '/Otp';
  static const all = <String>{
    splashPage,
    loginPage,
    otp,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.otp, page: Otp),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashPage(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
    Otp: (data) {
      final args = data.getArgs<OtpArguments>(
        orElse: () => OtpArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Otp(
          key: args.key,
          mobileNuber: args.mobileNuber,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// Otp arguments holder class
class OtpArguments {
  final Key key;
  final String mobileNuber;
  OtpArguments({this.key, this.mobileNuber});
}
