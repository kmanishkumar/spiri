import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:spiri/route/router.gr.dart';
import 'package:spiri/services/network/navigator.dart';
import 'package:spiri/services/storage.dart';
import 'package:supercharged/supercharged.dart';
import 'package:validators/validators.dart';

class SplashRepo {
  static checkLogin(BuildContext context) async {
    try {
      Future.delayed(2.seconds, () async {
        PackageInfo.fromPlatform().then((packageInfo) {
          if (Platform.isAndroid) {
            if (int.parse(packageInfo.buildNumber) <= 0) {
              StorageService.clearPrefs();
            }
          } else if (Platform.isIOS) {
            if (int.parse(packageInfo.buildNumber) <= 0) {
              StorageService.clearPrefs();
            }
          }
        });
        final _token = await StorageService.getToken();

        if (isNull(_token)) {
          AppNavigator.pp(Routes.loginPage);
        } else {
//        final _provider = Provider.of<DashboardRepo>(context, listen: false);
//
//        final _token = await StorageService.getToken();
//        final _email = await StorageService.getEmail();
//        final _firstName = await StorageService.getFirstName();
//        final _lastName = await StorageService.getLastNameName();
//        final _phoneNo = await StorageService.getPhone();
//        final _pPhone = await StorageService.getPPhone();
//
//        Map map = {
//          UserDetails.firstName: _firstName,
//          UserDetails.lastName: _lastName,
//          UserDetails.fullName: "$_firstName  $_lastName",
//          UserDetails.token: _token,
//          UserDetails.email: _email,
//          UserDetails.phone: _phoneNo,
//          UserDetails.plivoPhoneNumber: _pPhone
//        };
//
//        _provider.setUserDetails(map);
//
//        AppNavigator.pp(Routes.dashboardPage);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
