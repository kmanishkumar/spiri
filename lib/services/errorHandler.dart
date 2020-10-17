





import 'network/loggerServices.dart';

class ErrorHandler {
  static handleError(e) {
    SpiriLogger.e(e);
    throw e;
  }
}