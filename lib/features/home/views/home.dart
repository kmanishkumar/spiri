import 'package:async_loader/async_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:spiri/common/customWidget.dart';
import 'package:spiri/features/settingPage/setting.dart';
import 'package:spiri/features/signupPage/signupPageRepo/signupPageRepo.dart';
import 'package:spiri/features/uploadrequest/uploadRequest.dart';
import 'package:spiri/model/advertisementModel.dart';
import 'package:spiri/services/apicall.dart';
import 'package:spiri/services/image_loading.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sized_context/sized_context.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _asynckey = GlobalKey<AsyncLoaderState>();
  ApiCall apiCall = new ApiCall();
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
                screen: UploadRequestPage(),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              )
            },
          ),
        )
      ],
    );

    final _asyncLoader = Center(
        child: AsyncLoader(
      key: _asynckey,
      initState: () => SignUpPageRepo.getAllPhotos(),
      renderLoad: () => CircularProgressIndicator(),
      renderError: ([err]) => Text("Error"),
      renderSuccess: ({data}) => _generateBody(data),
    ));

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: _appBar, // this avoids the overflow error
        body: _asyncLoader);
  }

  _generateBody(List<AdvertismentImageModel> value) {
    return value.length == 0
        ? Center(child: Text("No Data", style: TextStyle()))
        : Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _showimage(value[0].advertisementImage1),
                        _showimage(value[0].advertisementImage2),
                        _showimage(value[0].advertisementImage3),
                        _showimage(value[0].advertisementImage4),
                      ],
                    ),
                  );
                }),
          );
  }

  _showimage(data) {
    final height = MediaQuery.of(context).size.height / 5;
    return SizedBox(
      height: height,
      width: height,
      child: Card(
        shape: CircleBorder(),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: SignUpPageRepo.getImageUrl(data),
              fit: BoxFit.fill,
              alignment: Alignment.center,
              placeholder: (context, url) => FindLoveImageLoadingShimmer(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
