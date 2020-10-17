import 'package:async_loader/async_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:spiri/common/customWidget.dart';
import 'package:spiri/features/signupPage/signupPageRepo/signupPageRepo.dart';
import 'package:spiri/services/apicall.dart';
import 'package:spiri/services/image_loading.dart';
import 'package:spiri/services/uiservices.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sized_context/sized_context.dart';
class SettingPage extends StatefulWidget {


  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {


  @override
  Widget build(BuildContext context) {

    final _appBar = AppBar(
      backgroundColor: Colors.deepPurple,
      elevation: 0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(
          "Your Area Spirian -Not Assigned",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'QSSM',
            fontSize: 12,
            letterSpacing: 2,
          ),
        ),
      ),
      leading: GestureDetector(
        child: Icon(Icons.call),
        onTap: ()=> launch("tel://"),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            child: Icon(Icons.settings),
            onTap: ()=>{
              pushNewScreen(
                context,
                screen: SettingPage(),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              )
            },


          ),
        )
      ],
    );
//    var _asyncLoader = new AsyncLoader(
//      key: _asynckey,
//      initState: () async => await _loadData(),
//      renderLoad: () => Center(
//          child: Center(child: CircularProgressIndicator(backgroundColor: Colors.blue))),
//      renderError: ([error]) =>
//          Center(child: Text('Sorry, there was an error')),
//      renderSuccess: ({data}) => _generateBody(data),
//    );
//    final _asyncLoader =
//    Consumer<SignUpPageRepo>(builder: (context, value, child) {
//      return AsyncLoader(
//        key: value.globalKey,
//        initState: () => SignUpPageRepo.getAllCity(),
//        renderLoad: () => SizedBox(),
//        renderError: ([err]) => Text("there was a error"),
//        renderSuccess: ({data}) => _generateBody(data),
//      );
//    });
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: _appBar,// this avoids the overflow error
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                        "UPDATE PROFILE",
                        style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
                      )
                    ],
                  ),
                ),

                onTap: () =>{

                }

              // BattlzNavigator.pn(Routes.signupPageForCoach)
            ),
            GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                  height: 50,

                  // padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(

                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "UPDATE PROFILE",
                        style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
                      )
                    ],
                  ),
                ),

                onTap: () =>{

                }

              // BattlzNavigator.pn(Routes.signupPageForCoach)
            ),
            GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                  height: 50,

                  // padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(

                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "SPIRIAN INFO",
                        style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
                      )
                    ],
                  ),
                ),

                onTap: () =>{

                }

              // BattlzNavigator.pn(Routes.signupPageForCoach)
            ),
            GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                  height: 50,

                  // padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(

                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "SPIRIAN RESPONDS",
                        style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
                      )
                    ],
                  ),
                ),

                onTap: () =>{

                }

              // BattlzNavigator.pn(Routes.signupPageForCoach)
            ),
            GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                  height: 50,

                  // padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(

                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "CALL HELPLINE",
                        style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
                      )
                    ],
                  ),
                ),

                onTap: () =>{

                }

              // BattlzNavigator.pn(Routes.signupPageForCoach)
            ),
            GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                  height: 50,

                  // padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(

                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "LOGOUT",
                        style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
                      )
                    ],
                  ),
                ),

                onTap: () =>{
                       logoutDialog(context)
                }

              // BattlzNavigator.pn(Routes.signupPageForCoach)
            ),
          ],
        )
    );
//    return Container(
//      child: Text("home"),
//    );
  }

  logoutDialog(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: double.maxFinite,
                      height: 140,
                      child: Container(
//                        color: Colors.white,
//                        shape: UIService.getRoundedCorners(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20)
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: 40),
                                child: Text("Are You Sure Want To Logout",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey,
                                        letterSpacing: -0.54,
                                        fontWeight: FontWeight.w400))),

                            Container(
                              child: Divider(
                                height: 02,
                                thickness: 0.9,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                                  Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          // value.popUpAnimation(5);
                                        },
                                        child: Text("Cancel",
                                            style:TextStyle(
                                              fontSize: 17,
                                              color: Colors.deepPurple,
                                              letterSpacing: -0.41,
                                            )),
                                      )
                                  ),
                                Container(
                                  height: 50.0,
                                  width: 1.0,
                                  color: Colors.grey,
                                ),
                                Container(
                                  child: GestureDetector(
                                    child: Text("Ok      ",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.deepPurple,
                                          letterSpacing: -0.41,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }



}