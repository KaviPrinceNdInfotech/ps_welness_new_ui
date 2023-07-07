// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:gyros_app/constants/app_colors.dart';
// import 'package:gyros_app/constants/buttons/customs_buttons.dart';
// import 'package:gyros_app/view/botttom_nav_bar/bottom_navbar.dart';
// import 'package:gyros_app/view/custom_widgets/my_theme.dart';
// import 'package:gyros_app/view/login_page/login_pagee.dart';
// import 'package:http/http.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../controllers/sign_up_controller/sign_up_controllers.dart';
//
// class SignUp extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _mobileController = TextEditingController();
//   TextEditingController _passsController = TextEditingController();
//   TextEditingController _confirmController = TextEditingController();
//
//   SignUpPageController _signUpPageController = Get.put(SignUpPageController());
//   SignUp({Key? key}) : super(key: key);
//
//   void register(String name, phone, email, password, confirmPassword) async {
//     try {
//       var response = await post(
//           Uri.parse("https://api.gyros.farm/api/AdminApi/Registration"),
//           body: {
//             'Name': name,
//             'Mobile_No': phone,
//             'Email_Id': email,
//             'Password': password,
//             'ConfirmPassword': confirmPassword
//           });
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body.toString());
//         print('&&&&&&&&&&&&&&&&&&&&&&${data}');
//         _toast(data);
//         // navigate to new screen
//         if (data['Status'] == 200) {
//           _toast(data);
//           Get.to(() => NavBar());
//         } else {
//           _toast(data);
//         }
//       } else {
//         Fluttertoast.showToast(
//             msg: 'Registration Failed',
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 3,
//             backgroundColor: Colors.grey,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       }
//     } catch (e) {
//       print('Error');
//       print(e.toString());
//     }
//   }
//
//   _toast(data) {
//     return Fluttertoast.showToast(
//         msg: '${data['Message']}',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 3,
//         backgroundColor: Colors.grey,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           height: size.height,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: NetworkImage(
//                       'https://images.unsplash.com/photo-1618411640018-972400a01458?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHN3ZWV0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60'
//                     //'https://images.pexels.com/photos/7267055/pexels-photo-7267055.jpeg?auto=compress&cs=tinysrgb&w=600'
//                     //'https://images.pexels.com/photos/8805182/pexels-photo-8805182.jpeg?auto=compress&cs=tinysrgb&w=600'
//                     //'https://images.pexels.com/photos/6280438/pexels-photo-6280438.jpeg?auto=compress&cs=tinysrgb&w=600'
//                     //'https://images.pexels.com/photos/6280438/pexels-photo-6280438.jpeg?auto=compress&cs=tinysrgb&w=600'
//                     //'https://images.pexels.com/photos/6280388/pexels-photo-6280388.jpeg?auto=compress&cs=tinysrgb&w=600'
//                     //'https://images.pexels.com/photos/6674392/pexels-photo-6674392.jpeg?auto=compress&cs=tinysrgb&w=600'
//                     //'https://images.pexels.com/photos/4258186/pexels-photo-4258186.jpeg?auto=compress&cs=tinysrgb&w=600',
//                     //'https://images.unsplash.com/photo-1590779033100-9f60a05a013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
//                     //'https://img.freepik.com/free-photo/fresh-vegetables-with-price-tags-shelf-grocery-store-supermarket_342744-1397.jpg?w=1800&t=st=1656765079~exp=1656765679~hmac=960f81d4a643d71d68c26c50e5b182ce5cee8ee12935b54cbf72f66ea89c3425'
//                     //'https://images.unsplash.com/photo-1608686207856-001b95cf60ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80'
//                     //'https://img.freepik.com/free-photo/woman-with-tablet-buying-healthy-food-supermarket-grocery-store_342744-1110.jpg?t=st=1656747606~exp=1656748206~hmac=cad4fcedf9befb2991319f1634acc32b038e0757fc8cb569c84777d87febd9be&w=1800'
//                     // 'https://images.unsplash.com/photo-1579113800032-c38bd7635818?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
//                     //'https://images.wallpapersden.com/image/download/las-vegas-night-hotel_Zmxtbm6UmZqaraWkpJRmbmdlrWZlbWU.jpg'
//                     //'https://i.pinimg.com/originals/01/96/c1/0196c1f3432b1a2ebac601dadb7b92cd.jpg'
//                   ),
//                   fit: BoxFit.fitHeight)),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               //crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 1.h,
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     height: size.height * 0.2,
//                     width: size.width * 0.5,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                       image: DecorationImage(
//                         image: AssetImage('lib/assets/asset/guser_logo.png'),
//                         fit: BoxFit.fitWidth,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Form(
//                   key: _formKey,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   child: Column(
//                     children: [
//                       //todo  name field
//                       Container(
//                         width: size.width * 0.8,
//                         height: size.height * 0.125,
//                         margin: EdgeInsets.symmetric(vertical: 0),
//                         padding:
//                         EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//                         decoration: BoxDecoration(
//                           //color: MyTheme.loginPageBoxColor,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: TextFormField(
//                           controller: _nameController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Username';
//                             }
//                             return null;
//                           },
//                           style: TextStyle(
//                             color: MyTheme.ThemeColors,
//                           ),
//                           cursorColor: MyTheme.ThemeColors,
//                           decoration: InputDecoration(
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                 width: 2,
//                                 color: MyTheme.ThemeColors,
//                               ),
//                             ),
//                             errorStyle: TextStyle(
//                                 color: Colors.red, fontWeight: FontWeight.w700),
//                             //border: InputBorder.none,
//                             fillColor: MyTheme.loginPageBoxColor,
//                             filled: true,
//                             focusColor: MyTheme.loginPageBoxColor,
//                             border: OutlineInputBorder(
//                               //borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                   width: 2, color: MyTheme.ThemeColors),
//                             ),
//                             //labelText: "Email",
//                             prefixIcon: Icon(
//                               Icons.person_rounded,
//                               color: MyTheme.ThemeColors,
//                             ),
//                             hintText: 'Enter Your Name',
//                             hintStyle: TextStyle(color: MyTheme.ThemeColors),
//                           ),
//                           //keyboardType: TextInputType.emailAddress,
//                         ),
//                       ),
//
//                       ///todo here phone......
//                       Container(
//                         width: size.width * 0.8,
//                         height: size.height * 0.125,
//                         margin: EdgeInsets.symmetric(vertical: 0),
//                         padding:
//                         EdgeInsets.symmetric(vertical: 1, horizontal: 0),
//                         decoration: BoxDecoration(
//                           //color: MyTheme.loginPageBoxColor,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: TextFormField(
//                           maxLength: 10,
//                           controller: _mobileController,
//                           keyboardType: TextInputType.phone,
//                           validator: (value) {
//                             if (value!.isEmpty || value.length < 10) {
//                               return 'Please enter Contact number';
//                             }
//                             return null;
//                           },
//                           style: TextStyle(
//                             color: MyTheme.ThemeColors,
//                           ),
//                           cursorColor: MyTheme.ThemeColors,
//                           decoration: InputDecoration(
//                             counterText: "",
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                 width: 2,
//                                 color: MyTheme.ThemeColors,
//                               ),
//                             ),
//                             errorStyle: TextStyle(
//                                 color: Colors.red, fontWeight: FontWeight.w700),
//                             //border: InputBorder.none,
//                             fillColor: MyTheme.loginPageBoxColor,
//                             filled: true,
//                             focusColor: MyTheme.loginPageBoxColor,
//                             border: OutlineInputBorder(
//                               //borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                   width: 2, color: MyTheme.ThemeColors),
//                             ),
//                             //labelText: "Email",
//                             prefixIcon: Icon(
//                               Icons.phone_android_outlined,
//                               color: MyTheme.ThemeColors,
//                             ),
//                             hintText: 'Enter Your Phone',
//                             hintStyle: TextStyle(color: MyTheme.ThemeColors),
//                           ),
//                         ),
//                       ),
//
//                       ///todo email field......
//                       Container(
//                         width: size.width * 0.8,
//                         height: size.height * 0.125,
//                         margin: EdgeInsets.symmetric(vertical: 0),
//                         padding:
//                         EdgeInsets.symmetric(vertical: 1, horizontal: 0),
//                         decoration: BoxDecoration(
//                           //color: MyTheme.loginPageBoxColor,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: TextFormField(
//                           controller: _emailController,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Enter email address";
//                             }
//                             String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
//                                 "\\@" +
//                                 "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
//                                 "(" +
//                                 "\\." +
//                                 "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
//                                 ")+";
//                             RegExp regExp = new RegExp(p);
//                             if (regExp.hasMatch(value)) {
//                               return null;
//                             }
//                             return 'Email is not valid';
//                           },
//                           style: TextStyle(
//                             color: MyTheme.ThemeColors,
//                           ),
//                           cursorColor: MyTheme.ThemeColors,
//                           decoration: InputDecoration(
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                 width: 2,
//                                 color: MyTheme.ThemeColors,
//                               ),
//                             ),
//                             errorStyle: TextStyle(
//                                 color: Colors.red, fontWeight: FontWeight.w700),
//                             //border: InputBorder.none,
//                             fillColor: MyTheme.loginPageBoxColor,
//                             filled: true,
//                             focusColor: MyTheme.loginPageBoxColor,
//                             border: OutlineInputBorder(
//                               //borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                   width: 2, color: MyTheme.ThemeColors),
//                             ),
//                             //labelText: "Email",
//                             prefixIcon: Icon(
//                               Icons.email_rounded,
//                               color: MyTheme.ThemeColors,
//                             ),
//                             hintText: 'Enter Your Email',
//                             hintStyle: TextStyle(color: MyTheme.ThemeColors),
//                           ),
//                           //keyboardType: TextInputType.emailAddress,
//                         ),
//                       ),
//
//                       ///todo here password................
//                       Container(
//                         width: size.width * 0.8,
//                         height: size.height * 0.125,
//                         margin: EdgeInsets.symmetric(vertical: 0),
//                         padding:
//                         EdgeInsets.symmetric(vertical: 1, horizontal: 0),
//                         decoration: BoxDecoration(
//                           //color: MyTheme.loginPageBoxColor,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: TextFormField(
//                           controller: _passsController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Password';
//                             }
//                             return null;
//                           },
//                           style: TextStyle(
//                             color: MyTheme.ThemeColors,
//                           ),
//                           cursorColor: MyTheme.ThemeColors,
//                           decoration: InputDecoration(
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                 width: 2,
//                                 color: MyTheme.ThemeColors,
//                               ),
//                             ),
//                             errorStyle: TextStyle(
//                                 color: Colors.red, fontWeight: FontWeight.w700),
//                             //border: InputBorder.none,
//                             fillColor: MyTheme.loginPageBoxColor,
//                             filled: true,
//                             focusColor: MyTheme.loginPageBoxColor,
//                             border: OutlineInputBorder(
//                               //borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                   width: 2, color: MyTheme.ThemeColors),
//                             ),
//                             //labelText: "Email",
//                             prefixIcon: Icon(
//                               Icons.lock_outlined,
//                               color: MyTheme.ThemeColors,
//                             ),
//                             hintText: 'Enter Your password',
//                             hintStyle: TextStyle(color: MyTheme.ThemeColors),
//                           ),
//                         ),
//                       ),
//
//                       ///todo here confirm password..........
//                       Container(
//                         width: size.width * 0.8,
//                         height: size.height * 0.120,
//                         margin: EdgeInsets.symmetric(vertical: 0),
//                         padding:
//                         EdgeInsets.symmetric(vertical: 1, horizontal: 0),
//                         decoration: BoxDecoration(
//                           //color: MyTheme.loginPageBoxColor,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: TextFormField(
//                           controller: _confirmController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Confirm password';
//                             }
//                             return null;
//                           },
//                           style: TextStyle(
//                             color: MyTheme.ThemeColors,
//                           ),
//                           cursorColor: MyTheme.ThemeColors,
//                           decoration: InputDecoration(
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                 width: 2,
//                                 color: MyTheme.ThemeColors,
//                               ),
//                             ),
//                             errorStyle: TextStyle(
//                                 color: Colors.red, fontWeight: FontWeight.w700),
//                             //border: InputBorder.none,
//                             fillColor: MyTheme.loginPageBoxColor,
//                             filled: true,
//                             focusColor: MyTheme.loginPageBoxColor,
//                             border: OutlineInputBorder(
//                               //borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                   width: 2, color: MyTheme.ThemeColors),
//                             ),
//                             //labelText: "Email",
//                             prefixIcon: Icon(
//                               Icons.lock,
//                               color: MyTheme.ThemeColors,
//                             ),
//                             hintText: 'ReEnter Your password',
//                             hintStyle: TextStyle(color: MyTheme.ThemeColors),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(
//                   height: 0.h,
//                 ),
//                 CustomButtom(
//                   buttonColor: MyTheme.loginbuttonColor,
//                   buttontext: 'Sign Up',
//                   textColor: Theme.of(context).colorScheme.onPrimary,
//                   handleButtonClick: () {
//                     if (_formKey.currentState!.validate()) {
//                       register(
//                           _nameController.text.toString(),
//                           _emailController.text.toString(),
//                           _passsController.text.toString(),
//                           _passsController.text.toString(),
//                           _confirmController.text.toString());
//                     }
//                   },
//                 ),
//                 SizedBox(
//                   height: 0.5.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Already have account ?',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 10.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Get.to(() => LoginPage());
//                       },
//                       child: Text(
//                         ' Login',
//                         style: TextStyle(
//                           color: AppColors.themecolors,
//                           fontSize: 11.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 0.5.h,
//                 ),
//
//                 // Align(
//                 //   alignment: Alignment.center,
//                 //   child: Container(
//                 //     height: 6.h,
//                 //     width: 65.w,
//                 //     decoration: BoxDecoration(
//                 //       border:
//                 //           Border.all(color: AppColors.themecolors, width: 1),
//                 //     ),
//                 //     child: Center(
//                 //       child: TextField(
//                 //         cursorColor: AppColors.themecolors,
//                 //         style: TextStyle(
//                 //             color: AppColors.themecolors, fontSize: 10.sp),
//                 //         decoration: InputDecoration(
//                 //           fillColor: Colors.grey.shade200,
//                 //           contentPadding: EdgeInsets.symmetric(
//                 //               vertical: 1.7.h, horizontal: 2.w),
//                 //           // border: OutlineInputBorder(
//                 //           //     borderRadius: BorderRadius.circular(0),
//                 //           //     borderSide: BorderSide(
//                 //           //       color: Colors.red,
//                 //           //       width: 1,
//                 //           //     )),
//                 //           hintText: 'Name',
//                 //           hintStyle: TextStyle(
//                 //               color: Colors.grey,
//                 //               fontSize: 10.sp,
//                 //               fontWeight: FontWeight.w500),
//                 //
//                 //           disabledBorder: InputBorder.none,
//                 //           border: InputBorder.none,
//                 //           filled: true,
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 2.h,
//                 // ),
//                 // Align(
//                 //   alignment: Alignment.center,
//                 //   child: Container(
//                 //     height: 6.h,
//                 //     width: 65.w,
//                 //     decoration: BoxDecoration(
//                 //       border:
//                 //           Border.all(color: AppColors.themecolors, width: 1),
//                 //     ),
//                 //     child: Center(
//                 //       child: TextField(
//                 //         obscureText: true,
//                 //         cursorColor: AppColors.themecolors,
//                 //         style: TextStyle(
//                 //             color: AppColors.themecolors, fontSize: 10.sp),
//                 //         decoration: InputDecoration(
//                 //           fillColor: Colors.grey.shade200,
//                 //           contentPadding: EdgeInsets.symmetric(
//                 //               vertical: 1.7.h, horizontal: 2.w),
//                 //           // border: OutlineInputBorder(
//                 //           //     borderRadius: BorderRadius.circular(0),
//                 //           //     borderSide: BorderSide(
//                 //           //       color: Colors.red,
//                 //           //       width: 1,
//                 //           //     )),
//                 //           hintText: 'Password',
//                 //           hintStyle: TextStyle(
//                 //               color: Colors.grey,
//                 //               fontSize: 10.sp,
//                 //               fontWeight: FontWeight.w500),
//                 //
//                 //           disabledBorder: InputBorder.none,
//                 //           border: InputBorder.none,
//                 //           filled: true,
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 5.h,
//                 // ),
//                 // InkWell(
//                 //   onTap: () {
//                 //     // Get.to(() => HomePage());
//                 //   },
//                 //   child: Container(
//                 //       height: 6.h,
//                 //       width: 65.w,
//                 //       decoration: BoxDecoration(
//                 //         border: Border.all(
//                 //             color: AppColors.themecolors, width: 1),
//                 //         color: AppColors.themecolors,
//                 //       ),
//                 //       child: Center(
//                 //         child: Text(
//                 //           'Login',
//                 //           style: TextStyle(
//                 //             color: Colors.white,
//                 //             fontSize: 10.sp,
//                 //             fontWeight: FontWeight.bold,
//                 //           ),
//                 //         ),
//                 //       )),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
