import 'dart:ui';

import 'package:async_loader/async_loader.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spiri/common/customWidget.dart';
import 'package:spiri/common/loaders.dart';
import 'package:spiri/features/dashboard/dashboard.dart';
import 'package:spiri/features/signupPage/models/login.model.dart';
import 'package:spiri/features/signupPage/signupPageRepo/signupPageRepo.dart';
import 'package:spiri/model/getdetailsSignUp.dart';
import 'package:spiri/services/apicall.dart';
import 'package:supercharged/supercharged.dart';
import 'package:sized_context/sized_context.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
  TextEditingController _area = TextEditingController();
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
      renderLoad: () => CircularProgressIndicator(),
      renderError: ([err]) => Text("Error"),
      renderSuccess: ({data}) => _generateBody(data),
    );
    return Scaffold(body: _asyncLoader);
  }

  _generateBody(List<CityModel> data) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 250),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                        _success(context, data),
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
                child: TypeAheadField(
                  hideOnError: true,
                  textFieldConfiguration: TextFieldConfiguration(
                      enabled: _city.text.trim() != "" ? true : false,
                      maxLines: 1,
                      controller: _area,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                          hintText: 'Search Your Area',
                          icon: Container(
                            margin: EdgeInsets.only(left: 10, bottom: 15),
                            width: 10,
                            height: 10,
                            child: Icon(Icons.search, color: Colors.black),
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.fromLTRB(0, 15.0, 20.0, 15.0),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ))),
                  suggestionsCallback: (pattern) async {
                    return await SignUpPageRepo.getAllArea(_city.text);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.gpo),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    _area.text = suggestion.gpo;
                  },
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
                  onTap: () => _createUser(context)
                  // BattlzNavigator.pn(Routes.signupPageForCoach)
                  ),
            ],
          ),
        ),
      ),
    );
  }

  _success(BuildContext context, List<CityModel> data) {
    final width = MediaQuery.of(context).size.width / 100;
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
              child: SizedBox(
                width: width * 70,
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(44, 51, 73, 0.16),
                          blurRadius: 16,
                          spreadRadius: 0)
                    ],
                    color: Colors.blue[900],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 5),
                      Text("Select City",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      Flexible(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          itemCount: data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => _citySelection(data[index]),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: CachedNetworkImage(
                                          imageUrl: data[index].cityImage,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                      Container(
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minWidth: 50,
                                            maxWidth: 50,
                                            minHeight: 15,
                                            maxHeight: 15,
                                          ),
                                          child: AutoSizeText(
                                            data[index].city,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 5),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  _citySelection(data) {
    Navigator.pop(context);
    setState(() {
      _city.text = data.city;
    });
  }

  void _createUser(BuildContext context) async {
    String name = _name.text.trim();
    String city = _city.text.trim();
    String gpo = _area.text.trim();
    if (name == "" || city == "" || gpo == "") {
      CustomWidgets.showWarningFlushBar(context, "Provide valid details");
      return;
    }
    if (!checkboxValue) {
      CustomWidgets.showWarningFlushBar(context, "Accept terms and conditions");
      return;
    }
    try {
      LoginModel result = await SignUpPageRepo.createUser(name, gpo);
      CustomWidgets.showWarningFlushBar(context, result.msg);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashboardPage()));
    } catch (e) {
      CustomWidgets.showWarningFlushBar(context, "Something went wrong");
    }
  }
}
