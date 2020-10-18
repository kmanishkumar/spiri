import 'dart:ui';

import 'package:async_loader/async_loader.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spiri/SpirianRequest/models/get_category.model.dart';
import 'package:spiri/SpirianRequest/models/get_sub_category.dart';
import 'package:spiri/features/dashboard/repo/dashboard.repo.dart';
import 'package:spiri/features/settingPage/setting.dart';
import 'package:url_launcher/url_launcher.dart';

class SpirianSubCategory extends StatefulWidget {
  final cateroryId;

  const SpirianSubCategory({Key key, @required this.cateroryId})
      : super(key: key);
  @override
  _SpirianSubCategoryState createState() => _SpirianSubCategoryState();
}

class _SpirianSubCategoryState extends State<SpirianSubCategory> {
  TextEditingController _search = TextEditingController();
  var token =
      "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI3MSJ9.ENAkk5JWfjAPhn0ExjZFu45C8geMeqQ1PkIZI-EcqPPFY_8GY-RhHz-5Ub1qG9xrXHYRtIvPjYhXkbU-CA4chQ";

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      backgroundColor: Colors.deepPurple,
      elevation: 0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(
          "Your Area Spirian-+91 111",
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
        onTap: () => launch("tel://"),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            child: Icon(Icons.settings),
            onTap: () => {
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
    final _asyncLoader = AsyncLoader(
      initState: () =>
          DashboardRepo.getSubCategory(token, "${widget.cateroryId}"),
      renderLoad: () => Center(child: CircularProgressIndicator()),
      renderError: ([err]) => Center(child: Text('Error')),
      renderSuccess: ({data}) => _generateUI(data),
    );
    return Scaffold(
        backgroundColor: Colors.white, appBar: _appBar, body: _asyncLoader);
  }

  _generateUI(List<GetSubCategoryModel> data) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        margin: EdgeInsets.only(right: 10),
        //  height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              child: CachedNetworkImage(
                  imageUrl: data[0].subcategoryImage,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error)),
            ),
            SizedBox(height: 5),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 50,
                maxWidth: 50,
                minHeight: 15,
                maxHeight: 15,
              ),
              child: AutoSizeText(
                data[0].subCategory,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: Colors.black),
              ),
            ),
            SizedBox(height: 5),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 50,
                maxWidth: 50,
                minHeight: 15,
                maxHeight: 15,
              ),
              child: AutoSizeText(
                data[0].content,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
