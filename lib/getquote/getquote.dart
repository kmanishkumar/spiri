import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spiri/features/settingPage/setting.dart';
import 'package:url_launcher/url_launcher.dart';

class GetQuote extends StatefulWidget {


  @override
  _GetQuoteState createState() => _GetQuoteState();
}

class _GetQuoteState extends State<GetQuote> {
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

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar,
        body:  Container(
          child: Text("home"),
        )
//      Stack(
//        alignment: Alignment.center,
//        children: <Widget>[
//          Center(
//            child: AsyncLoader(
//              initState: () => provider.getAllProfile(),
//              renderLoad: () => AppLoader(size: 100),
//              renderError: ([err]) => Text('There was a error'),
//              renderSuccess: ({data}) => _generateUI(provider),
//            ),
//          )
//        ],
//      ),
    );
  }
}