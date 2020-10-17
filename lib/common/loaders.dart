import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoader extends StatelessWidget {
  final double size;

  const AppLoader({Key key, this.size: 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitPulse(
      color: Colors.lightBlue,
      size: size,
    );
  }
}
