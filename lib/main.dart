import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:spiri/features/dashboard/repo/dashboard.repo.dart';
import 'package:spiri/features/splash/repo/splash.repo.dart';
import 'package:spiri/route/router.dart';
import 'package:flutter/material.dart';
import 'package:spiri/route/router.gr.dart' as r;

void main() => runApp(Spiri());

class Spiri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DashboardRepo()),
        ],
        child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', 'US'), // English
            const Locale('th', 'TH'), // Thai
          ],
          debugShowCheckedModeBanner: false,
          builder: ExtendedNavigator.builder<r.Router>(router: r.Router()),
        )
    );
  }
}
