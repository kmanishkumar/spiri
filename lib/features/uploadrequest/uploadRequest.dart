
import 'dart:io';
import 'dart:ui';

import 'package:async_loader/async_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:spiri/common/customWidget.dart';
import 'package:spiri/features/settingPage/setting.dart';
import 'package:spiri/features/signupPage/signupPageRepo/signupPageRepo.dart';
import 'package:spiri/services/apicall.dart';
import 'package:spiri/services/image_loading.dart';
import 'package:spiri/services/uiservices.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sized_context/sized_context.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:geolocator/geolocator.dart';
class UploadRequestPage extends StatefulWidget {


  @override
  _UploadRequestPageState createState() => _UploadRequestPageState();
}

class _UploadRequestPageState extends State<UploadRequestPage> {

  TextEditingController _date = new TextEditingController();
  TextEditingController _location = new TextEditingController();
  TextEditingController timeCtl = TextEditingController();
  TextEditingController _titleOfReq = TextEditingController();
  TextEditingController _summaryofwork = TextEditingController();
  Position _currentPosition;
  String _currentAddress;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress = "${place.name},${place.subLocality},${place.locality},${place.administrativeArea}, ${place.postalCode}, ${place.country}";
        _location.text=_currentAddress;
        print("_currentAddress   $_currentAddress");
      });
    } catch (e) {
      print(e);
    }
  }
 // final f = new DateFormat('yyyy-MM-dd hh:mm');

//  Text(f.format(new DateTime.fromMillisecondsSinceEpoch(values[index]["start_time"]*1000)));
  DateTime selectedDate = DateTime.now();

  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _location = TextEditingController(text:_currentAddress );
  }
   //FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {


    Future<Null> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1901, 1),
          lastDate: DateTime(2100));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          _date.value = TextEditingValue(text: picked.toString());
        });
    }
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
               Padding(
                 padding: const EdgeInsets.only(right: 20,left: 20,top: 10),
                 child:  GestureDetector(
                   onTap: () => _selectDate(context),
                   child: AbsorbPointer(
                     child: TextFormField(
                       controller: _date,
                       keyboardType: TextInputType.datetime,
                       decoration: InputDecoration(
                         labelText: 'Select Date',
                           labelStyle: TextStyle(
                               color: Colors.deepPurple
                           )
                       ),
                     ),
                   ),
                 )
               ),
             Padding(
               padding: const EdgeInsets.only(right: 20,left: 20),
               child: TextFormField(
                controller: timeCtl,  // add this line.
                decoration: InputDecoration(
                  labelText: 'Select Time',
                    labelStyle: TextStyle(
                        color: Colors.deepPurple
                    )
                ),
                onTap: () async {
                  TimeOfDay time = TimeOfDay.now();
                  FocusScope.of(context).requestFocus(new FocusNode());

                  TimeOfDay picked =
                  await showTimePicker(context: context, initialTime: time);
                  if (picked != null && picked != time) {
                    timeCtl.text = picked.toString();  // add this line.
                    setState(() {
                      time = picked;
                    });
                  }
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'cant be empty';
                  }
                  return null;
                },
            ),
             ),
            Padding(
              padding: const EdgeInsets.only(right:20,left: 20),
              child: TextFormField(
                controller: _location,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Current Location',
                    labelStyle: TextStyle(
                        color: Colors.deepPurple
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:20,left: 20),
              child: TextFormField(
                controller: _titleOfReq,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    labelText: 'Title of Request',
                    labelStyle: TextStyle(
                        color: Colors.deepPurple
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:20,left: 20,bottom: 15),
              child: TextFormField(
                controller: _summaryofwork,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    labelText: 'Title of Request',
                    labelStyle: TextStyle(
                        color: Colors.deepPurple
                    )
                ),
               ),
             ),
//            ListView.builder(
//                scrollDirection: Axis.horizontal,
//                itemCount: _image.length,
//                itemBuilder: (context,c)
//                {
//
//                  return Card(
//                    child: Image.file(_image[c],
//                      fit: BoxFit.fill,
//                      width: 400,
//                      height: 400,
//
//                    ),
//                  );
//                }
//            ),
             Center(
               child: GestureDetector(
                 child: Icon(
                   Icons.file_upload,
                   size: 70,
                   color: Colors.deepPurple,
                 ),
                 onTap: (){
                   _showPicker(context);
                 },
               ),
             ),
            SizedBox(height:20),
            Center(
              child: Text(
                 "Upload Image"
              ),
            ),
            GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 130, right: 130, top: 20),
                  height: 50,

                  // padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(

                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "SUBMIT",
                        style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
                      )
                    ],
                  ),
                ),

                onTap: () =>{

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

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }




}