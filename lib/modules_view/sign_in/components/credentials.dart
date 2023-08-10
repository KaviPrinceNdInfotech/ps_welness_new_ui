// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ps_welness_new_ui/constants/constants/constants.dart';
// import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
// import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
// import 'package:ps_welness_new_ui/modules_view/forget_password_view/forget_password_view.dart';
// import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// // import 'package:ps_welness/constants/constants/constants.dart';
// // import 'package:ps_welness/controllers/login_email/login_email_controller.dart';
// // import 'package:ps_welness/modules_view/circular_loader/circular_loaders.dart';
// // import 'package:ps_welness/modules_view/forget_password_view/forget_password_view.dart';
// // import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// // import 'package:ps_welness/widgets/widgets/rectangular_button.dart';
//
// class Credentials extends StatelessWidget {
//   Credentials({Key? key}) : super(key: key);
//
//   // String location = 'Null, Press Button';
//   // String Address = 'search';
//   // Future<Position> _getGeoLocationPosition() async {
//   //   bool serviceEnabled;
//   //   LocationPermission permission;
//   //   // Test if location services are enabled.
//   //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   //   if (!serviceEnabled) {
//   //     // Location services are not enabled don't continue
//   //     // accessing the position and request users of the
//   //     // App to enable the location services.
//   //     await Geolocator.openLocationSettings();
//   //     return Future.error('Location services are disabled.');
//   //   }
//   //   permission = await Geolocator.checkPermission();
//   //   if (permission == LocationPermission.denied) {
//   //     permission = await Geolocator.requestPermission();
//   //     if (permission == LocationPermission.denied) {
//   //       return Future.error('Location permissions are denied');
//   //     }
//   //   }
//   //   if (permission == LocationPermission.deniedForever) {
//   //     // Permissions are denied forever, handle appropriately.
//   //     return Future.error(
//   //         'Location permissions are permanently denied, we cannot request permissions.');
//   //   }
//   //   // When we reach here, permissions are granted and we can
//   //   // continue accessing the position of the device.
//   //   return await Geolocator.getCurrentPosition(
//   //       desiredAccuracy: LocationAccuracy.high);
//   // }
//
//   LoginpasswordController _loginpasswordController =
//       Get.put(LoginpasswordController());
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Form(
//       key: _loginpasswordController.loginpasswordformkey,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: size.width * 0.09, vertical: size.height * 0.02),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 controller: _loginpasswordController.emailController,
//                 onSaved: (value) {
//                   _loginpasswordController.email = value!;
//                 },
//                 validator: (value) {
//                   return _loginpasswordController.validEmail(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'User ID',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.account_circle,
//                     color: black.withOpacity(0.7),
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                 ),
//                 keyboardType: TextInputType.visiblePassword,
//                 //obscureText: true,
//                 //controller: _loginpasswordController.mobileController,
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 controller: _loginpasswordController.passwordController,
//                 onSaved: (value) {
//                   _loginpasswordController.password = value!;
//                 },
//                 validator: (value) {
//                   return _loginpasswordController.validPassword(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.lock,
//                     color: black.withOpacity(0.7),
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             // RectangularInputField(
//             //   hintText: 'Password',
//             //   icon: Icons.lock,
//             //   obscureText: true,
//             // ),
//             SizedBox(
//               height: size.height * 0.00,
//               //appPadding / 2,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: InkWell(
//                 onTap: () {
//                   Get.to(() => ForgotPassword());
//                 },
//                 child: Text(
//                   'Forget Password?',
//                   style: GoogleFonts.alegreya(
//                     fontWeight: FontWeight.w600,
//                     color: Colors.grey.shade700,
//                     fontSize: size.width * 0.035,
//                   ),
//                 ),
//               ),
//             ),
//             // Align(
//             //   alignment: Alignment.centerRight,
//             //   child: InkWell(
//             //     onTap: () {
//             //
//             //       Get.to(() => ChangePassword());
//             //     },
//             //     child: Text(
//             //       'Change Password?',
//             //       style: GoogleFonts.alegreya(
//             //         fontWeight: FontWeight.w600,
//             //         color: Colors.grey.shade700,
//             //         fontSize: size.width * 0.035,
//             //       ),
//             //     ),
//             //   ),
//             // ),
//
//             RectangularButton(
//                 text: 'Sign In',
//                 press: () {
//                   CallLoader.loader();
//                   _loginpasswordController.checkLoginpassword();
//                   // _getGeoLocationPosition();
//                   // Position position = await _getGeoLocationPosition();
//
//                   //Get.to(SignUpList());
//                   //_loginpasswordController.checkLoginpassword();
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/forget_password_view/forget_password_view.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/login_email/login_email_controller.dart';
// import 'package:ps_welness/modules_view/circular_loader/circular_loaders.dart';
// import 'package:ps_welness/modules_view/forget_password_view/forget_password_view.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

class Credentials extends StatelessWidget {
  Credentials({Key? key}) : super(key: key);

  final LoginpasswordController _loginpasswordController =
      Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _loginpasswordController.loginpasswordformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.09, vertical: size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _loginpasswordController.emailController,
                onSaved: (value) {
                  _loginpasswordController.email = value!;
                },
                validator: (value) {
                  return _loginpasswordController.validEmail(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'User ID',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.visiblePassword,
                //obscureText: true,
                //controller: _loginpasswordController.mobileController,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _loginpasswordController.passwordController,
                onSaved: (value) {
                  _loginpasswordController.password = value!;
                },
                validator: (value) {
                  return _loginpasswordController.validPassword(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Password',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            ///

            // RectangularInputField(
            //   hintText: 'Password',
            //   icon: Icons.lock,
            //   obscureText: true,
            // ),

            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Get.to(() => ForgotPassword());
                },
                child: Text(
                  'Forget Password?',
                  style: GoogleFonts.alegreya(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: InkWell(
            //     onTap: () {
            //
            //       Get.to(() => ChangePassword());
            //     },
            //     child: Text(
            //       'Change Password?',
            //       style: GoogleFonts.alegreya(
            //         fontWeight: FontWeight.w600,
            //         color: Colors.grey.shade700,
            //         fontSize: size.width * 0.035,
            //       ),
            //     ),
            //   ),
            // ),
            RectangularButton(
                text: 'Sign In',
                press: () async {
                  // CallLoader.loader();
                  _loginpasswordController.checkLoginpassword();
                  // _getGeoLocationPosition();
                  CallLoader.loader();
                  await Future.delayed(Duration(seconds: 1));
                  CallLoader.hideLoader();
                  //CallLoader.hideLoader();

                  // await Future.delayed(Duration(seconds: 1));
                  //       // Get.snackbar("Failed", "${r.body}");
                  //       CallLoader.hideLoader();
                  //Get.to(SignUpList());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    await Future.delayed(Duration(seconds: 2));
    await Get.dialog(
      // bool barrierDismissible = true

      AlertDialog(
        title: const Text('Ps Wellness'),
        content: const Text(
            """When you grant permission for  location access in our application, we may collect and process certain information related to your geographical location. This includes GPS coordinates, Wi-Fi network information, cellular tower data, Background Location, and other relevant data sources to determine your device's location."""),
        actions: [
          TextButton(
            child: const Text("Reject"),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text("Accept"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      barrierDismissible: false,
    );

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return Future.value('');
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
