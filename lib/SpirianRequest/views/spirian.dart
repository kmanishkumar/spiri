import 'dart:ui';

import 'package:async_loader/async_loader.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spiri/SpirianRequest/models/get_category.model.dart';
import 'package:spiri/SpirianRequest/views/sub_spirian_category.dart';
import 'package:spiri/features/dashboard/repo/dashboard.repo.dart';
import 'package:spiri/features/settingPage/setting.dart';
import 'package:url_launcher/url_launcher.dart';

class SpirianRequest extends StatefulWidget {
  @override
  _SpirianRequestState createState() => _SpirianRequestState();
}

class _SpirianRequestState extends State<SpirianRequest> {
  TextEditingController _search = TextEditingController();
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
      initState: () => DashboardRepo.getCategory(),
      renderLoad: () => Center(child: CircularProgressIndicator()),
      renderError: ([err]) => Center(child: Text('Error')),
      renderSuccess: ({data}) => _generateUI(data),
    );
    return Scaffold(
        backgroundColor: Colors.white, appBar: _appBar, body: _asyncLoader);
  }

  _generateUI(List<GetCategoryModel> data) {
    final width = MediaQuery.of(context).size.width / 100;
    final height = MediaQuery.of(context).size.height / 100;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _search,
              minLines: 1,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffix: Text(
                    "Search not found",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 17)),
            ),
            SizedBox(height: 10),
            Text("Service Categories"),
            SizedBox(height: 10),
            Container(
              height: height * 30,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => pushNewScreen(
                        context,
                        screen: SpirianSubCategory(cateroryId: data[index].id),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 100,
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error)),
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
                                data[index].category,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ]),
    );
  }
}
