import 'dart:io';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spiri/SpirianRequest/spirian.dart';
import 'package:spiri/features/home/home.dart';
import 'package:spiri/getquote/getquote.dart';
import 'package:spiri/marketplace/marketplace.dart';
import 'package:spiri/offer/offer.dart';
import 'package:spiri/res/constant.dart';
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {



  PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    //PushNotificationsManager.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      confineInSafeArea: false,
      backgroundColor: Colors.deepPurple,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }

  _buildScreens() {
    return [
      Home(),
      SpirianRequest(),
      Offer(),
      GetQuote(),
      MarketPlace()
    ];
  }

  _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SvgPicture.asset(
              home_logo,color: Colors.white,
              //alignment: Alignment.center,
              height: 25,
              width: 25,
            ),
            RichText(
             text: TextSpan(
               text: 'Home',style: TextStyle(fontSize: 10)
             ),

            )
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SvgPicture.asset(
              spirianRequest,color: Colors.white,
              //alignment: Alignment.center,
              height: 25,
              width: 25,
            ),
            RichText(
              text: TextSpan(
                  text: 'Spirian Request',style: TextStyle(fontSize: 10)

              ),

            )
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SvgPicture.asset(
              offer,color: Colors.white,
              //alignment: Alignment.center,
              height: 25,
              width: 25,
            ),
            RichText(
              text: TextSpan(
                  text: 'Offer',style: TextStyle(fontSize: 10)
              ),

            )
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SvgPicture.asset(
              getquote,color: Colors.white,
              //alignment: Alignment.center,
              height: 25,
              width: 25,
            ),
            RichText(
              text: TextSpan(
                  text: 'Get Quote',style: TextStyle(fontSize: 10)
              ),

            )
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SvgPicture.asset(
              marketplace,color: Colors.white,
              //alignment: Alignment.center,
              height: 25,
              width: 25,
            ),
            RichText(
              text: TextSpan(
                  text: 'Market Place',style: TextStyle(fontSize: 10)
              ),

            )
          ],
        ),
      ),
    ];
  }



}
