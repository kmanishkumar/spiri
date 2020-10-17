
import 'package:auto_route/auto_route_annotations.dart';
import 'package:spiri/features/login/login.dart';
import 'package:spiri/features/otp/otpPage.dart';
import 'package:spiri/features/splash/spash.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: LoginPage),
  MaterialRoute(page: Otp),
  //MaterialRoute(page: DashboardPage)
])
class $Router {}
