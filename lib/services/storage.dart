import 'package:prefs_guard/prefsguard.dart';
import 'package:spiri/res/constant.dart';

class StorageService {
  static final prefs = PrefsGuard(GuardType.AES);

  static clearPrefs() {
    prefs.clearAll();
  }

  static setToken(v) {
    prefs.write(key: PrefsConstants.token, value: v);
  }

  static getToken() {
    return prefs.read(key: PrefsConstants.token);
  }

  static setOtp(v) {
    prefs.write(key: PrefsConstants.otp, value: v);
  }

  static getOtp() async {
    return prefs.read(key: PrefsConstants.otp);
  }
}
