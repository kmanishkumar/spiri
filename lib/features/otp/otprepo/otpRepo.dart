//import 'dart:convert';
//
//import 'package:battlz/common/CustomWidgets.dart';
//import 'package:battlz/feautures/forgetpassword/newforgetpassword/view/foregot.newpassowrd.dart';
//import 'package:battlz/feautures/login/profile/view/profile.dart';
//import 'package:battlz/feautures/login/res/constant.dart';
//import 'package:battlz/feautures/otp/view/otp.dart';
//import 'package:battlz/network/api.network.dart';
//import 'package:battlz/network/dio_client.dart';
//import 'package:battlz/routes/router.gr.dart';
//import 'package:battlz/services/navigator.dart';
//import 'package:battlz/services/storage.dart';
//import 'package:battlz/services/ui.service.dart';
//import 'package:dio/dio.dart';
//import 'package:flutter/material.dart';
//import 'package:spiri/api/api.dart';
//import 'package:spiri/common/customWidget.dart';
//import 'package:spiri/res/constant.dart';
//import 'package:spiri/services/network/dio_client.dart';
//import 'package:spiri/services/storage.dart';
//
//import 'package:validators/validators.dart';
//import 'package:sized_context/sized_context.dart';
//
//
//class OtpRepo {
//  static otpVerification(context, otp) async{
//    print(otp);
//    if (isNull(otp)) {
//      CustomWidgets.showWarningFlushBar(context, "Please enter otp");
//    }
////    else if (!isEmail(otp)) {
////      CustomWidgets.showWarningFlushBar(context, "Please enter valid otp");
////    }
//    else {
////      stl();
//     // final email = await StorageService.getEmail();
//      Map map = {"email": "","otp": otp};
//
//      final apiCall = RestClient(DioClient.getDio());
//
//      apiCall.verifyOtp(json.encode(map)).then((data) async {
//        await StorageService.setToken( data.otp);
//        CustomWidgets.showSuccessFlushBar(
//            context, "otp verify ");
//        //BattlzNavigator.pop();
//        Future.delayed(Duration(milliseconds: 1000), () {
////          Navigator.push(
////              context,
////              MaterialPageRoute(
////                  builder: (context) => ForgetNewPassword()));
//        });
//      }
//      ).catchError((err) {
//        final error = (err as DioError).response;
//        if (error.statusCode == 500) {
//          CustomWidgets.showWarningFlushBar(context, "otp is not correct ");
//          // spl();
//        } else {
////          spl();
//          CustomWidgets.showWarningFlushBar(context, 'Something went wrong');
//        }
//      });
//    }
//  }
//}
//
