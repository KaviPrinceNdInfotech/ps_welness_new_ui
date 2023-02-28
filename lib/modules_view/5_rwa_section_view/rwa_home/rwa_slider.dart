import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:gyros_app/view/home_page/home_page_controller.dart';
import 'package:http/http.dart' as http;

import '../../../controllers/10_lab_controller/lab_home_controllers/lab_home_controller.dart';
import '../../../controllers/1_user_view_controller/user_home_page_controller/user_home_page_controllers.dart';
import '../../../controllers/2_franchises_controller/franchies_home_page_controller/franchies_home_page_controllers.dart';
import '../../../controllers/3_driver_view_controllers/driver_home_page_controller/driver_home_page_controllers.dart';
import '../../../controllers/4_nurse_controller/nurse_home_page_controller/nurse_home_page_controllers.dart';
import '../../../controllers/5_rwa_controller/rwa_home_page_controller/rwa_home_page_controllers.dart';


//import 'package:http/http.dart' as http;

class RwaSlider extends StatelessWidget {
  final _sliderKey = GlobalKey();
  RwaSlider({Key? key}) : super(key: key);
  RwaHomepagContreoller _rwaHomepagContreoller = Get.put(RwaHomepagContreoller());

  //HomePageController _homePageController = Get.put(HomePageController());

  // Future<List<String>> getData() async {
  //   var url = 'http://test.pswellness.in/api/SignupApi/getBanner/?id=1';
  //   //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
  //   var res = await http.get(Uri.parse(url));
  //   if (res.statusCode == 200) {
  //     var data = json.decode(res.body);
  //     var rest = data["BannerImageList"];
  //     //your json string
  //     String jsonString = json.encode(rest);
  //     //convert json string to list
  //     List<String> newData = List<String>.from(json.decode(jsonString));
  //     print("List Size&&&&&&&&&&&&&&&: ${newData}");
  //     return newData;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  final List<String> images = [
    'lib/assets/asset/ghee5.jpeg',
    'lib/assets/asset/oil_1.jpeg',
    'lib/assets/asset/honey2.jpeg',
    'lib/assets/asset/gaggery4.jpeg',
    'lib/assets/asset/spice1.jpeg',
    'lib/assets/asset/sattu6.jpeg',
    'lib/assets/asset/sweet3.jpeg',
    'lib/assets/asset/dal4.jpeg',
  ];
  final bool _isPlaying = true;

  // get _sliderKey => null;

  @override
  Widget build(BuildContext context) {
    var base = 'http://test.pswellness.in/Images/';
    //var base = 'https://api.gyros.farm/Images/';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
            () => (_rwaHomepagContreoller.isLoading.value)
            ? Center(child: CircularProgressIndicator())
        //:_franchiseHomepagContreoller.banerlistmodel?.bannerImageList == null
            :_rwaHomepagContreoller.banerlistmodel!.bannerImageList.isEmpty

        //_userhomePageController.banerlistmodel!.bannerImageList!.isEmpty
        //: _userhomePageController.getsliderbaner!.bannerImageList == null
        //: _allProductController.allProductModel!.result!.isEmpty
        //_bestSellerController.bestsellermodel!.result!.isEmpty
            ? Center(
          child: Text('No data'),
        )
            : SizedBox(
          height:size.height*0.33,
          child: CarouselSlider.builder(
            //scrollPhysics: NeverScrollableScrollPhysics(),
            key: _sliderKey,
            unlimitedMode: true,
            autoSliderTransitionTime: Duration(seconds: 2),
            //autoSliderDelay: Duration(seconds: 5),
            slideBuilder: (index) {
              return Container(
                height: size.height*0.29,
                alignment: Alignment.center,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //       image: NetworkImage(base +
                //           '${_homePageController.getsliderbaner!.bannerImageList![index]}'),
                //
                //   fit: BoxFit.fill),

                child: Container(
                  height: size.height * 0.33,
                  width: size.width,
                  // height: 26.h,
                  child: Image.network(
                    base + '${_rwaHomepagContreoller.banerlistmodel!.bannerImageList[index].bannerPath.toString()}',
                    //base+'${_userhomePageController.banerlistmodel!.bannerImageList![index].toString()}',
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      //if image not comming in catagary then we have to purchase

                      return Center(
                        child: Text(
                          'No Image',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height*0.02,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            slideTransform: ZoomOutSlideTransform(),
            slideIndicator: CircularSlideIndicator(
              indicatorBorderWidth: 2,
              indicatorRadius: 4,
              itemSpacing: 15,
              currentIndicatorColor: Colors.white,
              padding: EdgeInsets.only(bottom: 5),
            ),
            itemCount: _rwaHomepagContreoller.banerlistmodel!.bannerImageList!.length,
            enableAutoSlider: true,
          ),

          // FutureBuilder<List<String>>(
          //   future: getData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       var items = snapshot.data;
          //       var base = 'https://api.gyros.farm/Images/';
          //       return Container(
          //         height: 26.h,
          //         child: CarouselSlider.builder(
          //           //scrollPhysics: NeverScrollableScrollPhysics(),
          //           key: _sliderKey,
          //           unlimitedMode: true,
          //           autoSliderTransitionTime: Duration(seconds: 2),
          //           //autoSliderDelay: Duration(seconds: 5),
          //           slideBuilder: (index) {
          //             return Container(
          //               height: 26.h,
          //               alignment: Alignment.center,
          //               decoration: BoxDecoration(
          //                 image: DecorationImage(
          //                     image: NetworkImage(base + '${items![index]}'),
          //                     fit: BoxFit.fill),
          //               ),
          //             );
          //           },
          //           slideTransform: ZoomOutSlideTransform(),
          //           slideIndicator: CircularSlideIndicator(
          //             indicatorBorderWidth: 2,
          //             indicatorRadius: 4,
          //             itemSpacing: 15,
          //             currentIndicatorColor: Colors.white,
          //             padding: EdgeInsets.only(bottom: 6),
          //           ),
          //           itemCount: items!.length,
          //           enableAutoSlider: true,
          //         ),
          //       );
          //
          //       /*  ListView(
          //         physics: NeverScrollableScrollPhysics(),
          //         children: <Widget>[
          //           Container(
          //             height: 26.h,
          //             child: CarouselSlider.builder(
          //               //scrollPhysics: NeverScrollableScrollPhysics(),
          //               key: _sliderKey,
          //               unlimitedMode: true,
          //               autoSliderTransitionTime: Duration(seconds: 2),
          //               //autoSliderDelay: Duration(seconds: 5),
          //               slideBuilder: (index) {
          //                 return Container(
          //                   height: 26.h,
          //                   alignment: Alignment.center,
          //                   decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                         image: NetworkImage('${'Images'}'),
          //                         fit: BoxFit.fill),
          //                   ),
          //                   //color: colors[index],
          //                   // child: Text(
          //                   //   letters[index],
          //                   //   style: TextStyle(fontSize: 200, color: Colors.white),
          //                   // ),
          //                 );
          //               },
          //               slideTransform: ZoomOutSlideTransform(),
          //               slideIndicator: CircularSlideIndicator(
          //                 indicatorBorderWidth: 2,
          //                 indicatorRadius: 4,
          //                 itemSpacing: 15,
          //                 currentIndicatorColor: Colors.white,
          //                 padding: EdgeInsets.only(bottom: 6),
          //               ),
          //               itemCount: images.length,
          //               enableAutoSlider: true,
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.symmetric(vertical: 1),
          //             child: Align(
          //               child: ConstrainedBox(
          //                 constraints:
          //                     BoxConstraints(minWidth: 190, maxWidth: 600),
          //               ),
          //             ),
          //           ),
          //         ],
          //       );*/
          //     } else if (snapshot.hasError) {
          //       return Text("${snapshot.error}");
          //     }
          //     return Center(
          //         child: CircularProgressIndicator(
          //       color: Colors.white,
          //     ));
          //   },
          // )
        ),
      ),
    );
  }
}
