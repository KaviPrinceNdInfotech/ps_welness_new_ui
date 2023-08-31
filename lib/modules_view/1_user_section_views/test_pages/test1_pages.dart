// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class GymType extends StatelessWidget {
//   const GymType({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         // backgroundColor: backgroundc,
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             '',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.black,
//             ),
//           ),
//           elevation: 3,
//           backgroundColor: Colors.white,
//           leading: Icon(
//             Icons.arrow_back_ios_new,
//             color: Colors.black,
//           ).onTap(() {
//             Get.back();
//           }),
//           bottom: PreferredSize(
//             preferredSize: Size(20, 30),
//             child: Column(
//               children: [
//                 // 0.h.heightBox,
//                 TabBar(
//                   indicatorWeight: 3,
//                   unselectedLabelColor: Colors.black,
//
//                   labelColor: Colors.red,
//                   indicatorPadding: const EdgeInsets.all(0),
//                   // indicator: BoxDecoration(
//                   //   border: Border.all(color: Colors.red),
//                   //   borderRadius: BorderRadius.circular(0),
//                   //   //color:  selectbutton,
//                   // ),
//                   indicatorColor: Colors.red,
//                   //labelColor: Colors.yellow,
//                   labelStyle: TextStyle(fontSize: 0),
//                   labelPadding: EdgeInsets.symmetric(vertical: 0),
//                   indicatorSize: TabBarIndicatorSize.label,
//                   padding: EdgeInsets.symmetric(horizontal: 0),
//                   tabs: [
//                     Tab(
//                       child: Text(
//                         'Favourite',
//                         style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       child: Text(
//                         'Executive',
//                         style: TextStyle(
//                             fontSize: 13, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Tab(
//                       child: Text(
//                         'Elite',
//                         style: TextStyle(
//                             fontSize: 13, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     //Tab(child: Text('FAQs',style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.bold),),),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     //height: 75.h,
//                     width: 950,
//                     //color: Colors.green,
//                     //
//
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         //2.h.heightBox,
//                         Material(
//                           elevation: 4,
//                           child: Container(
//                             height: 45,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                   prefixIcon: Icon(
//                                     Icons.search,
//                                     color: Colors.grey,
//                                   ),
//                                   hintText: 'Search for Gym center',
//                                   hintStyle: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 13,
//                                   ),
//                                   filled: true,
//                                   fillColor: Colors.white),
//                             ),
//                           ),
//                         ),
//                         // 2.h.heightBox,
//                         SizedBox(
//                           height: 100,
//                           child: ListView.builder(
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return PhysicalModel(
//                                 elevation: 8.0,
//                                 shape: BoxShape.rectangle,
//                                 shadowColor: Colors.black,
//                                 color: Colors.white,
//                                 child: Container(
//                                   height: 180,
//                                   width: 900,
//                                   color: Colors.blue[50],
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         height: 180,
//                                         width: 330,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                                 image: NetworkImage(
//                                                   'https://c4.wallpaperflare.com/wallpaper/206/268/839/pose-muscle-muscle-rod-press-hd-wallpaper-preview.jpg',
//                                                 ),
//                                                 fit: BoxFit.cover)),
//                                       ),
//                                       //3.w.widthBox,
//                                       Container(
//                                         height: 150,
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Den Fitness Center',
//                                               style: TextStyle(
//                                                 fontSize: 150,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             Text(
//                                               """Netaji nagar Hii no 3 90 feet
// road,Sakinaka.Andheri(E),
// Mumbai-400072 """,
//                                               style: TextStyle(
//                                                 fontSize: 9,
//                                                 letterSpacing: 0.3,
//                                                 color: Colors.grey,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Container(
//                                                   height: 32,
//                                                   width: 100,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                     color: Color(0xff00B912),
//                                                   ),
//                                                   child: Row(
//                                                     children: [
//                                                       Text(
//                                                         '  4.3',
//                                                         style: TextStyle(
//                                                           fontSize: 9,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Colors.white,
//                                                         ),
//                                                       ),
//                                                       Icon(
//                                                         Icons.star,
//                                                         size: 14,
//                                                         color: Colors.amber,
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 //  2.w.widthBox,
//                                                 Text(
//                                                   'Starting@999/-',
//                                                   style: TextStyle(
//                                                     fontSize: 10,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                                 //2.w.widthBox,
//                                                 Container(
//                                                   height: 32,
//                                                   width: 120,
//                                                   decoration: BoxDecoration(
//                                                       color: Color(0xffFF0000),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5)),
//                                                   child: Row(
//                                                     children: [
//                                                       Icon(
//                                                         Icons.place,
//                                                         size: 13,
//                                                         color: Colors.white,
//                                                       ),
//                                                       Text(
//                                                         '3 km',
//                                                         style: TextStyle(
//                                                           fontSize: 8,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Colors.white,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ).pSymmetric(h: 10),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   // FlutterLogo(
//                                   //   size: 60,
//                                   // ),
//                                 ).pSymmetric(v: 10),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ).pSymmetric(h: 40),
//                   ).onTap(() {
//                     //Get.to(()=>CategaryPage2());
//                   })
//                 ],
//               ),
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     //height: 75.h,
//                     width: 950,
//                     //color: Colors.green,
//                     //
//
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // 2.h.heightBox,
//                         Material(
//                           elevation: 4,
//                           child: Container(
//                             height: 45,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                   prefixIcon: Icon(
//                                     Icons.search,
//                                     color: Colors.grey,
//                                   ),
//                                   hintText: 'Search for Gym center',
//                                   hintStyle: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 13,
//                                   ),
//                                   filled: true,
//                                   fillColor: Colors.white),
//                             ),
//                           ),
//                         ),
//                         //2.h.heightBox,
//                         SizedBox(
//                           height: 700,
//                           child: ListView.builder(
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return PhysicalModel(
//                                 elevation: 8.0,
//                                 shape: BoxShape.rectangle,
//                                 shadowColor: Colors.black,
//                                 color: Colors.white,
//                                 child: Container(
//                                   height: 180,
//                                   width: 900,
//                                   color: Colors.blue[50],
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         height: 180,
//                                         width: 330,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                                 image: NetworkImage(
//                                                   'https://c4.wallpaperflare.com/wallpaper/206/268/839/pose-muscle-muscle-rod-press-hd-wallpaper-preview.jpg',
//                                                 ),
//                                                 fit: BoxFit.cover)),
//                                       ),
//                                       //3.w.widthBox,
//                                       Container(
//                                         height: 150,
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Den Fitness Center',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             Text(
//                                               """Netaji nagar Hii no 3 90 feet
// road,Sakinaka.Andheri(E),
// Mumbai-400072 """,
//                                               style: TextStyle(
//                                                 fontSize: 90,
//                                                 letterSpacing: 0.3,
//                                                 color: Colors.grey,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Container(
//                                                   height: 33,
//                                                   width: 100,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                     color: Color(0xff00B912),
//                                                   ),
//                                                   child: Row(
//                                                     children: [
//                                                       Text(
//                                                         '  4.3',
//                                                         style: TextStyle(
//                                                           fontSize: 9,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Colors.white,
//                                                         ),
//                                                       ),
//                                                       Icon(
//                                                         Icons.star,
//                                                         size: 14,
//                                                         color: Colors.amber,
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 // 2.w.widthBox,
//                                                 Text(
//                                                   'Starting@999/-',
//                                                   style: TextStyle(
//                                                     fontSize: 10,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                                 //2.w.widthBox,
//                                                 Container(
//                                                   height: 32,
//                                                   width: 120,
//                                                   decoration: BoxDecoration(
//                                                       color: Color(0xffFF0000),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5)),
//                                                   child: Row(
//                                                     children: [
//                                                       Icon(
//                                                         Icons.place,
//                                                         size: 13,
//                                                         color: Colors.white,
//                                                       ),
//                                                       Text(
//                                                         '3 km',
//                                                         style: TextStyle(
//                                                           fontSize: 8,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Colors.white,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ).pSymmetric(h: 10),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   // FlutterLogo(
//                                   //   size: 60,
//                                   // ),
//                                 ).pSymmetric(v: 10),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ).pSymmetric(h: 40),
//                   ).onTap(() {
//                     //Get.to(()=>CategaryPage2());
//                   })
//                 ],
//               ),
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     //height: 75.h,
//                     width: 950,
//                     //color: Colors.green,
//                     //
//
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         //2.h.heightBox,
//                         Material(
//                           elevation: 4,
//                           child: Container(
//                             height: 45,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                   prefixIcon: Icon(
//                                     Icons.search,
//                                     color: Colors.grey,
//                                   ),
//                                   hintText: 'Search for Gym center',
//                                   hintStyle: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 13,
//                                   ),
//                                   filled: true,
//                                   fillColor: Colors.white),
//                             ),
//                           ),
//                         ),
//                         //2.h.heightBox,
//                         SizedBox(
//                           height: 700,
//                           child: ListView.builder(
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return PhysicalModel(
//                                 elevation: 8.0,
//                                 shape: BoxShape.rectangle,
//                                 shadowColor: Colors.black,
//                                 color: Colors.white,
//                                 child: Container(
//                                   height: 180,
//                                   width: 900,
//                                   color: Colors.blue[50],
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         height: 180,
//                                         width: 330,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                                 image: NetworkImage(
//                                                   'https://c4.wallpaperflare.com/wallpaper/206/268/839/pose-muscle-muscle-rod-press-hd-wallpaper-preview.jpg',
//                                                 ),
//                                                 fit: BoxFit.cover)),
//                                       ),
//                                       //  3.w.widthBox,
//                                       Container(
//                                         height: 150,
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Den Fitness Center',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             Text(
//                                               """Netaji nagar Hii no 3 90 feet
// road,Sakinaka.Andheri(E),
// Mumbai-400072 """,
//                                               style: TextStyle(
//                                                 fontSize: 9,
//                                                 letterSpacing: 0.3,
//                                                 color: Colors.grey,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Container(
//                                                   height: 32,
//                                                   width: 100,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                     color: Color(0xff00B912),
//                                                   ),
//                                                   child: Row(
//                                                     children: [
//                                                       Text(
//                                                         '  4.3',
//                                                         style: TextStyle(
//                                                           fontSize: 9,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Colors.white,
//                                                         ),
//                                                       ),
//                                                       Icon(
//                                                         Icons.star,
//                                                         size: 14,
//                                                         color: Colors.amber,
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 //2.w.widthBox,
//                                                 Text(
//                                                   'Starting@999/-',
//                                                   style: TextStyle(
//                                                     fontSize: 10,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                                 // 2.w.widthBox,
//                                                 Container(
//                                                   height: 32,
//                                                   width: 120,
//                                                   decoration: BoxDecoration(
//                                                       color: Color(0xffFF0000),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5)),
//                                                   child: Row(
//                                                     children: [
//                                                       Icon(
//                                                         Icons.place,
//                                                         size: 13,
//                                                         color: Colors.white,
//                                                       ),
//                                                       Text(
//                                                         '3 km',
//                                                         style: TextStyle(
//                                                           fontSize: 8,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Colors.white,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ).pSymmetric(h: 10),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   // FlutterLogo(
//                                   //   size: 60,
//                                   // ),
//                                 ).pSymmetric(v: 10),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ).pSymmetric(h: 40),
//                   ).onTap(() {
//                     //Get.to(()=>CategaryPage2());
//                   })
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
///
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
//import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyTest extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: textEditingController,
              onSaved: (phoneNumber) {
                textEditingController.text = phoneNumber!;
              },
            ),
          ),
          ElevatedButton(
            child: Text("_launchPhoneURL"),
            onPressed: () {
              _launchPhoneURL(textEditingController.text);
            },
          ),
          ElevatedButton(
            child: Text("_callNumber"),
            onPressed: () {
              _callNumber(textEditingController.text);
            },
          )
        ],
      ),
    );
  }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  //String number = "34342222";

  await FlutterPhoneDirectCaller.callNumber(number);
}

_launchPhoneURL(String phoneNumber) async {
  String url = 'tel:' + phoneNumber;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
