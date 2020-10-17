
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spiri/features/otp/otpPage.dart';
import 'package:spiri/features/signup/signupPage.dart';
import 'package:spiri/features/signupPage/signupPage.dart';
import 'package:spiri/res/constant.dart';
import 'package:spiri/route/router.gr.dart';
import 'package:spiri/services/network/navigator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//  final _emailC = TextEditingController(text: "kirt@arsenalmkg.com");
//  final _passwordC = TextEditingController(text: "password123");
  //bool _obSecureText = true;
  TextEditingController _mobilenumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    var _topGap = SizedBox(
      height: 10,
    );
    var _mobileCard = SizedBox(
      width:MediaQuery.of(context).size.width,
           child: Column(
             children: [

               Image.asset(splash_logo,height: 200,width: 200,),
               SizedBox(height: 100),
               Container(
                 height: 50,
                 margin: EdgeInsets.only(right: 30,left: 30,bottom: 10),
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.deepPurple,
                     //style: BorderStyle.solid,
                      width: 2.0,
                   ),
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 child:  Padding(
                   padding: const EdgeInsets.only(left: 10,top: 13),
                   child: TextField(
                     textAlign: TextAlign.start,
                     textCapitalization: TextCapitalization.sentences,
                     expands: true,
                     decoration:  InputDecoration.collapsed(
                       hintText: 'Mobile Number',
                       hintStyle: TextStyle(
                         color: Colors.grey,
                         fontSize: 17
                       )
                     ),
                     // autofocus: false,
                     maxLines: null,
                     controller: _mobilenumber,
                     //keyboardType: TextInputType.text,
                   ),
                 ),
               ),
               GestureDetector(
                   child: Container(
                     margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                    height: 50,

                    // padding: EdgeInsets.only(top: 10, bottom: 10),
                     decoration: BoxDecoration(

                         color: Colors.deepPurple,
                         borderRadius: BorderRadius.circular(10.0)),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text(
                           "Submit",
                           style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
                         )
                       ],
                     ),
                   ),

                     onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage(mobileNuber: _mobilenumber.text,)))

                      // BattlzNavigator.pn(Routes.signupPageForCoach)
               ),
             ],
           ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_topGap, _mobileCard],
          ),
        ),
      ),
    );
  }
}
