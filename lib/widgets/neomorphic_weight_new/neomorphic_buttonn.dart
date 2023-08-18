import 'package:flutter/material.dart';

// void main() => runApp(NeumorphicApp());
//
// class NeumorphicApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Neumorphic App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         backgroundColor: Colors.blueGrey.shade200,
//         scaffoldBackgroundColor: Colors.blueGrey.shade200,
//         dialogBackgroundColor: Colors.blueGrey.shade200,
//       ),
//       home: Scaffold(
//         body: Center(
//           child: NeumorphicContainer(
//             color: Colors.transparent,
//             child: Text(
//               'Space',
//              // style: Typography.blackCupertino.display2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class NeumorphicbuttonContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;

  NeumorphicbuttonContainer({
    Key? key,
    required this.child,
    this.bevel = 10.0,
    required this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicbuttonContainerState createState() =>
      _NeumorphicbuttonContainerState();
}

class _NeumorphicbuttonContainerState extends State<NeumorphicbuttonContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = this.widget.color ?? Theme.of(context).backgroundColor;

    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.bevel * 10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _isPressed ? color : Colors.black38,
                _isPressed ? Colors.black12 : color,
                _isPressed ? Colors.black12 : color,
                _isPressed ? Colors.black12 : Colors.black12
              ],
              stops: [
                0.0,
                .0,
                .9,
                1.0,
              ]),
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    blurRadius: widget.bevel,
                    offset: -widget.blurOffset,
                    color: Colors.white,
                  ),
                  BoxShadow(
                    blurRadius: widget.bevel,
                    offset: widget.blurOffset,
                    color: Colors.black38,
                    //color.mix(Colors.black, .3),
                  )
                ],
        ),
        child: widget.child,
      ),
    );
  }
}

extension ColorUtils on Color {
  Color? mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
