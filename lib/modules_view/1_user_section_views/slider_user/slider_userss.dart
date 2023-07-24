import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../controllers/1_user_view_controller/user_home_page_controller/user_home_page_controllers.dart';

//import 'package:http/http.dart' as http;

class MySlider extends StatelessWidget {
  final _sliderKey = GlobalKey();
  MySlider({Key? key}) : super(key: key);
  UserHomepagContreoller _userhomePageController =
      Get.put(UserHomepagContreoller());

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  // final List<String> images = [
  //   'lib/assets/asset/ghee5.jpeg',
  //   'lib/assets/asset/oil_1.jpeg',
  //   'lib/assets/asset/honey2.jpeg',
  //   'lib/assets/asset/gaggery4.jpeg',
  //   'lib/assets/asset/spice1.jpeg',
  //   'lib/assets/asset/sattu6.jpeg',
  //   'lib/assets/asset/sweet3.jpeg',
  //   'lib/assets/asset/dal4.jpeg',
  // ];
  final bool _isPlaying = true;

  // get _sliderKey => null;

  @override
  Widget build(BuildContext context) {
    var base = 'http://test.pswellness.in/Images/';
    var image = 'http://test.pswellness.in/Images/';

    //var base = 'https://api.gyros.farm/Images/';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => (_userhomePageController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _userhomePageController.banerlistmodel?.bannerImageList == null
                //_userhomePageController.banerlistmodel!.bannerImageList!.isEmpty
                //: _userhomePageController.getsliderbaner!.bannerImageList == null
                //: _allProductController.allProductModel!.result!.isEmpty
                //_bestSellerController.bestsellermodel!.result!.isEmpty
                ? Center(
                    child: Text('No data'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: size.height * 0.34,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Material(
                          color: MyTheme.ThemeColors,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          child: CarouselSlider.builder(
                            //scrollPhysics: NeverScrollableScrollPhysics(),
                            key: _sliderKey,
                            unlimitedMode: true,
                            autoSliderTransitionTime: Duration(seconds: 1),
                            //autoSliderDelay: Duration(seconds: 5),
                            slideBuilder: (index) {
                              var item = _userhomePageController
                                  .banerlistmodel?.bannerImageList;
                              return Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Material(
                                  elevation: 12,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: size.height * 0.38,
                                    width: size.width,
                                    alignment: Alignment.center,
                                    // decoration: BoxDecoration(
                                    //   image: DecorationImage(
                                    //       image: NetworkImage(base +
                                    //           '${_homePageController.getsliderbaner!.bannerImageList![index]}'),
                                    //
                                    //   fit: BoxFit.fill),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.white, width: 0),
                                      // image: DecorationImage(
                                      //     image:
                                      //     NetworkImage(
                                      //         '$image${item?[index].bannerPath}' ??
                                      //             ''),
                                      //     fit: BoxFit.fill),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "$image${item?[index].bannerPath}" ??
                                              '',
                                      fit: BoxFit.fill,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                              colorFilter: ColorFilter.mode(
                                                  Colors.transparent,
                                                  BlendMode.colorBurn)),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
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
                              padding: EdgeInsets.only(bottom: 0),
                            ),
                            itemCount: _userhomePageController
                                .banerlistmodel!.bannerImageList!.length,
                            enableAutoSlider: true,
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
