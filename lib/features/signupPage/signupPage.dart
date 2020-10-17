import 'dart:ui';

import 'package:async_loader/async_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spiri/common/customWidget.dart';
import 'package:spiri/common/loaders.dart';
import 'package:spiri/features/dashboard/dashboard.dart';
import 'package:spiri/features/signupPage/signupPageRepo/signupPageRepo.dart';
import 'package:spiri/model/getdetailsSignUp.dart';
import 'package:spiri/services/apicall.dart';
import 'package:supercharged/supercharged.dart';
import 'package:sized_context/sized_context.dart';

class SignUpPage extends StatefulWidget {
  final String mobileNuber;

  const SignUpPage({Key key, this.mobileNuber}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  final _asynckey = GlobalKey<AsyncLoaderState>();
  FocusNode _focusNode = FocusNode();
  ApiCall apiCall = new ApiCall();
  TextEditingController _name = TextEditingController();
  TextEditingController _city = TextEditingController();
  bool checkboxValue = false;
  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 300.0, end: 50.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  // Future _loadData() async {
  //   try {
  //     final result = await apiCall.getSoul(null);
  //     if (result != null) {
  //       return result;
  //     } else {
  //       CustomWidgets.showSuccessFlushBar(context, "Somthing went wrong");
  //     }
  //   } catch (e) {
  //     CustomWidgets.showSuccessFlushBar(context, "Somthing went wrong");
  //   }
  // }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _asyncLoader = AsyncLoader(
      key: _asynckey,
      initState: () => SignUpPageRepo.getAllCity(),
      renderLoad: () => SizedBox(),
      renderError: ([err]) => Text("there was a error"),
      renderSuccess: ({data}) => _generateBody(data),
    );

    // var _asyncLoader = new AsyncLoader(
    //   key: _asynckey,
    //   initState: () async => await _loadData(),
    //   renderLoad: () => Center(
    //       child: Center(
    //           child: CircularProgressIndicator(backgroundColor: Colors.blue))),
    //   renderError: ([error]) =>
    //       Center(child: Text('Sorry, there was an error')),
    //   renderSuccess: ({data}) => _generateBody(data),
    // );

    return Scaffold(
        resizeToAvoidBottomPadding: false, // this avoids the overflow error
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _asyncLoader,
          ],
        )
//      InkWell( // to dismiss the keyboard when the user tabs out of the TextField
//        splashColor: Colors.transparent,
//        onTap: () {
//          FocusScope.of(context).requestFocus(FocusNode());
//        },
//        child: Container(
//          padding: const EdgeInsets.all(20.0),
//          child: Column(
//            children: <Widget>[
//              SizedBox(height: _animation.value),
//              TextFormField(
//                decoration: InputDecoration(
//                  labelText: 'I move!',
//                ),
//                focusNode: _focusNode,
//              )
//            ],
//          ),
//        ),
//      ),
        );
  }

  _generateBody(List<CityModel> value) {
    print(value);
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            //SizedBox(height: _animation.value),
            SizedBox(height: 100),
            Container(
              height: 50,
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                  //style: BorderStyle.solid,
                  width: 2.0,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 13),
                child: TextField(
                  textAlign: TextAlign.start,
                  textCapitalization: TextCapitalization.sentences,
                  expands: true,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 17)),
                  // autofocus: false,
                  maxLines: null,
                  controller: _name,
                  //keyboardType: TextInputType.text,
                ),
              ),
            ),
            GestureDetector(
                child: Container(
                  height: 50,
                  margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurple,
                      //style: BorderStyle.solid,
                      width: 2.0,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 13),
                    child: TextField(
                      textAlign: TextAlign.start,
                      textCapitalization: TextCapitalization.sentences,
                      expands: true,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Select City',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 17)),
                      // autofocus: false,
                      maxLines: null,
                      controller: _city,
                      enabled: false,
                      //keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                onTap: () => {
                      _success(context),
                    }),
            Container(
              height: 50,
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                  //style: BorderStyle.solid,
                  width: 2.0,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 13),
                child: TextField(
                  textAlign: TextAlign.start,
                  textCapitalization: TextCapitalization.sentences,
                  expands: true,
                  decoration: InputDecoration(
                      hintText: 'Search Your Area',
                      icon: Container(
                        margin: EdgeInsets.only(left: 10, bottom: 30),
                        width: 10,
                        height: 10,
                        child: Icon(Icons.search),
                      ),
//                        prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 3),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      )),
                  // autofocus: false,
                  maxLines: null,
                  //controller: _name,
                  //keyboardType: TextInputType.text,
                ),
              ),
            ),
            CheckboxListTile(
              value: checkboxValue,
              onChanged: (val) => {setState(() => checkboxValue = val)},
              title: new Text(
                'By checking this you are agreeing to our Terms and conditions',
                style: TextStyle(fontSize: 14.0),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
            ),
            GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardPage()))

                // BattlzNavigator.pn(Routes.signupPageForCoach)
                ),
          ],
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }

  _success(BuildContext context) async {
    return showGeneralDialog(
      context: context,
      transitionDuration: 250.milliseconds,
      barrierDismissible: true,
      barrierLabel: 'dilaog',
      barrierColor: Colors.white54,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: 305,
                    height: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(44, 51, 73, 0.16),
                              blurRadius: 16,
                              spreadRadius: 0)
                        ],
//
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            child: Text(
                              "Select City",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(51, 102, 255, 1),
                                  fontWeight: FontWeight.w600),
//                                  style: TextStyle(color: Color.fromRGBO(51, 102, 255, 1),
//                                      fontSize: 20,
//                                      fontWeight:FontWeight.w600 )
                            ),
                          ),
                          Container(
                            height: 64,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(44, 51, 73, 0.16),
                                    blurRadius: 16,
                                    spreadRadius: 0)
                              ],
                              color: Colors.black,
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, position) {
                                return Container(
                                  width: context.widthPx,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(0),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(44, 51, 73, 0.16),
                                          spreadRadius: 0,
                                          blurRadius: 16,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        )
                                      ]),
                                );
                              },
                            ),
                          ),
                          Text('test')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
