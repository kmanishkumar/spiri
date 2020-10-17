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
  List<String> widgetList = ['A', 'B', 'C','D'];
  var token = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI3MSJ9.ENAkk5JWfjAPhn0ExjZFu45C8geMeqQ1PkIZI-EcqPPFY_8GY-RhHz-5Ub1qG9xrXHYRtIvPjYhXkbU-CA4chQ";
  Future _loadData() async {
    try {
      final result = await apiCall.getAllImage(null);
      if (result != null) {
        return result;
      } else {
        CustomWidgets.showSuccessFlushBar(
            context, "Somthing went wrong");
      }
    } catch (e) {
      CustomWidgets.showSuccessFlushBar(
          context, "Somthing went wrong");
    }
  }
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
                    screen: UploadRequestPage(),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
            )
            },

          ),
        )
      ],
    );

//    final _asyncLoader = AsyncLoader(
//      key: _asynckey,
//      initState: () => SignUpPageRepo.getAllPhotos(token),
//      renderLoad: () => SizedBox(),
//      renderError: ([err]) => Text("there was a error"),
//      renderSuccess: ({data}) => _generateBody(data),
//    );


    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: _appBar,// this avoids the overflow error
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

           //_asyncLoader,
        ],
     )
    );
  }

  _generateBody(List<AdvertismentImageModel>  value) {
    print(value);
    return   Container(
            child:
            Expanded(
              child:  value.length == 0 ? Center(child: Text("No Data", style: TextStyle())) : GridView.builder(
                  itemCount: value.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: (context.widthPx / 2.0 / 100)),
                  itemBuilder: (context, i) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 200,
                            width: 180,
                            child: Card(
                              shape: CircleBorder(

                              ),
                              clipBehavior: Clip.antiAlias,
                              color: Colors.white,
                              child: Stack(
                                alignment: Alignment.center,
                                fit: StackFit.expand,
                                children: <Widget>[
                                  CachedNetworkImage(
                                    imageUrl:value[i].advertisementImage1,
                                    //list[i].photo[0].url,
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                    placeholder: (context, url) =>
                                        FindLoveImageLoadingShimmer(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],

                      ),
                    );
                  }
              ),
            ),
    );
  }
}