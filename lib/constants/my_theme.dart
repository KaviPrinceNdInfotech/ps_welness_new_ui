import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

// const Color lightPrimary = Color.fromRGBO(255, 208, 0, 1);
// const Color darkPrimary = Color.fromRGBO(255, 184, 0, 1);
// const Color black = Colors.black;
// const Color darkShadow = Color.fromRGBO(222, 160, 0, 1);
// const Color lightShadow = Color.fromRGBO(255, 208, 0, 1);

const double appPadding = 30;

class MyTheme {
  static Color white = Color(0xffffffff);
  static Color ThemeColors1 = Color(0xff00caf7);
  static Color ThemeColors = Color(0xff0abab5);
  static Color loginbuttonColor = Color(0xff9bbb4c);
  static Color textcolor = Color(0xfffd4f3ec);
  static Color blueww = Color(0xff023382);

  static Color text1 = Color(0xffd3ecda);
  static Color signUpButtonColor = Colors.grey.shade400;
  // static Color loginPageBoxColor = Color(0xffccccff);
  static Color loginPageBoxColor = Colors.grey.shade300;
  static Color ContainerUnSelectedColor = Color(0xffeff8f5);

  static double defaultPading = 15.0;
  static Color containergradient = Color(0xffF6F7DD);
  static Color containercolor1 = Color(0xff8cdba9);
  static Color containercolor01 = Color(0xff425F57);
  static Color containercolor2 = Color(0xffa5f0c5);
  static Color containercolor3 = Color(0xffd5f591);
  static Color containercolor4 = Color(0xffffc06e);
  static Color containercolor5 = Color(0xff019875);
  static Color containercolor6 = Color(0xff596e5c);
  static Color containercolor7 = Color(0xff002408);
  static Color containercolor8 = Color(0xffa9c7ac);
  static Color containercolor9 = Color(0xffd1aca5);
  static Color containercolor10 = Color(0xffe2cfc9);
  static Color containercolor11 = Color(0xff006400);

  static Color containercolor12 = Color(0xff3a923b);
  static Color containercolor13 = Color(0xffb5d047);
  //184704

  static Color containercolor14 = Color(0xff236706);

  static Color containercolor15 = Color(0xff184704);
  static Color containercolor16 = Color(0xffc9c702);
  static Color containercolor17 = Color(0xff0b806b);

  static Color containercolor18 = Color(0xffd11a2a);

  static LinearGradient gradient1 = const LinearGradient(
    colors: <Color>[
      Color(0xff2cc487),
      Color(0xff2cc499),
      Color(0xff3ad286),
      Color(0xff6ec481),
      Color(0xff37c97e),
      Color(0xff47bd82),
      Color(0xff209c87),
      Color(0xff0b806b),
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.topLeft,
    end: Alignment(0.9, 1),
  );

  static LinearGradient gradient2 = const LinearGradient(
    colors: <Color>[
      Color(0xff0b806b),
      Color(0xff47bd82),
      Color(0xff0b806b),
      // Color(0xff6ec481),
      // Color(0xff37c97e),
      // Color(0xff47bd82),
      // Color(0xff209c87),
      // Color(0xff0b806b),
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient gradient10 = const LinearGradient(
    colors: <Color>[
      Color(0xff31ccb0),
      Color(0xff2c90c4),

      // Color(0xff0b806b),
      // Color(0xff6ec481),
      // Color(0xff37c97e),
      // Color(0xff47bd82),
      // Color(0xff209c87),
      // Color(0xff0b806b),
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static SweepGradient sweepGradient1 = SweepGradient(
    colors: [
      Colors.blue.shade400,
      Colors.green.shade200,
      Colors.yellow.shade300,
      Colors.red,
      Colors.blue.shade400,
    ],
    stops: [0.0, 0.25, 0.5, 0.70, 1],
  );

  static SweepGradient sweepGradient2 = SweepGradient(
    colors: [
      Colors.indigo.shade300,
      Colors.cyan.shade200,
      Colors.yellow.shade200,
      Colors.pink,
      Colors.green.shade100,
    ],
    stops: [0.0, 0.25, 0.5, 0.70, 1],
  );

  static RadialGradient radial1 = RadialGradient(
      colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink],
      stops: [0.2, 0.5, 0.7, 1]);

  static LinearGradient gradient3 = const LinearGradient(
    colors: <Color>[
      Color(0xff47bd82),
      Color(0xff47bd82),
      Color(0xff209c87),
      // Color(0xff6ec481),
      // Color(0xff37c97e),
      // Color(0xff47bd82),
      // Color(0xff209c87),
      // Color(0xff0b806b),
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient gradient33 = const LinearGradient(
    colors: <Color>[
      Color(0xffc1e3ff),
      Color(0xffabc7ff),
      // Color(0xff209c87),
      //Color(0xff6ec481),
      // Color(0xff37c97e),
      // Color(0xff47bd82),
      // Color(0xff209c87),
      //Color(0xff0b806b),
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient gradient35 =
      const LinearGradient(colors: [Color(0xff1ca9c9), Color(0xff2ee8bb)]);

  static LinearGradient gradient4 =
      const LinearGradient(colors: [Colors.green, Colors.blue]);

  static LinearGradient gradient5 =
      const LinearGradient(colors: [Colors.red, Colors.yellowAccent]);

  static LinearGradient gradient6 = LinearGradient(
    colors: [
      const Color(0xffD6FF7F),
      //Colors.blueGrey.shade500,
      const Color(0xff00B3CC)
    ],

    // begin: const FractionalOffset(0.0, 0.0),
    // end: const FractionalOffset(1.0, 0.0),
    // stops: [0.0, 1.0],
    // tileMode: TileMode.clamp,
  );

  static LinearGradient gradient12 = LinearGradient(
    colors: [
      const Color(0xff3a923b),
      const Color(0xffb5d047),
      //Colors.blueGrey.shade500,
    ],

    // begin: const FractionalOffset(0.0, 0.0),
    // end: const FractionalOffset(1.0, 0.0),
    // stops: [0.0, 1.0],
    // tileMode: TileMode.clamp,
  );

  static LinearGradient gradient7 = LinearGradient(
    colors: [
      Color(0xFF0061ff),
      Color(0xFF60efff),
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  static LinearGradient gradient71 = LinearGradient(
    colors: [
      Color(0xFF60efff),
      Color(0xFF0061ff),
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  static LinearGradient gradient8 =
      const LinearGradient(colors: [Color(0xff402565), Color(0xff30BE96)]);
  static LinearGradient gradient81 =
      const LinearGradient(colors: [Color(0xff30BE96), Color(0xff402565)]);

  static LinearGradient gradient9 = const LinearGradient(
    colors: [
      Color.fromARGB(255, 148, 231, 225),
      Color.fromARGB(255, 62, 182, 226)
    ],
  );

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        canvasColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        hoverColor: Color(0xff27ae61),
        //Color(0xff25D366);
        //Color(0xff9bbb4c);

        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.white,
            onPrimary: Colors.black87,
            secondary: Colors.black87,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.red,
            background: Colors.black,
            onBackground: Colors.black,
            surface: Colors.cyan.shade500,
            onSurface: Colors.cyan),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        canvasColor: Colors.black,
        hoverColor: Color(0xff27ae61),
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.black,
            onPrimary: Colors.white,
            secondary: Colors.black87,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.red,
            background: Colors.black,
            onBackground: Colors.black,
            surface: Colors.cyan.shade500,
            onSurface: Colors.cyan),
        fontFamily: GoogleFonts.poppins().fontFamily,
      );
}
