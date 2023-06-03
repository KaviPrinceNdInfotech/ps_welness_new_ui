import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwaBanner_controller.dart';

//import '../../../controllers/5_rwa_controller_RRR/rwaBanner_controller.dart';

class MySliderwa extends StatelessWidget {
  final _sliderKey = GlobalKey();
  MySliderwa({Key? key}) : super(key: key);
  RwaBannerController _rwaBannerController = Get.put(RwaBannerController());

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
    //var base = 'https://api.gyros.farm/Images/';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => (_rwaBannerController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _rwaBannerController.getRwaBannerModel?.bannerImageList == null
                //_userhomePageController.banerlistmodel!.bannerImageList!.isEmpty
                //: _userhomePageController.getsliderbaner!.bannerImageList == null
                //: _allProductController.allProductModel!.result!.isEmpty
                //_bestSellerController.bestsellermodel!.result!.isEmpty
                ? Center(
                    child: Text('No data'),
                  )
                : SizedBox(
                    height: size.height * 0.33,
                    child: CarouselSlider.builder(
                      //scrollPhysics: NeverScrollableScrollPhysics(),
                      key: _sliderKey,
                      unlimitedMode: true,
                      autoSliderTransitionTime: Duration(seconds: 2),
                      //autoSliderDelay: Duration(seconds: 5),
                      slideBuilder: (index) {
                        return Container(
                          height: size.height * 0.29,
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
                              '$base${_rwaBannerController.getRwaBannerModel!.bannerImageList[index].bannerPath.toString()}',
                              //base+'${_userhomePageController.banerlistmodel!.bannerImageList![index].toString()}',
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                //if image not comming in catagary then we have to purchase

                                return Center(
                                  child: Text(
                                    'No Image',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height * 0.02,
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
                      itemCount: _rwaBannerController
                          .getRwaBannerModel!.bannerImageList.length,

                      enableAutoSlider: true,
                    ),
                  ),
      ),
    );
  }
}
