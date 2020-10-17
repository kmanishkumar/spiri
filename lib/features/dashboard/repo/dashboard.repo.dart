import 'package:flutter/material.dart';

class DashboardRepo extends ChangeNotifier {
  Map _userDetails;

  Map get userDetails => _userDetails;

  setUserDetails(Map val) {
    _userDetails = val;
    print(val["fullName"]);
    notifyListeners();
  }
}
