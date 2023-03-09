import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double percentage = 0.75;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      // width = MediaQuery.of(context).size.width * 0.75;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      percentage = details.position.dx / MediaQuery.of(context).size.width;
    });
    print(percentage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              color: Colors.amber,
            ),
          ),
          Center(
            child: FittedBox(
              child: RichText(
                text: TextSpan(
                  text: 'Cool ',
                  style: TextStyle(fontSize: 200, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Header',
                        style: GoogleFonts.lobster(
                            textStyle: TextStyle(
                                fontSize: 200,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                    TextSpan(
                      text: ' Effect',
                      style: TextStyle(fontSize: 200, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: ClipRect(
              clipper: Clipper(percentage),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color.fromRGBO(27, 25, 39, 1.0),
                child: Center(
                  child: FittedBox(
                    child: RichText(
                      text: TextSpan(
                        text: 'Cool ',
                        style: TextStyle(fontSize: 200, color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Header',
                              style: GoogleFonts.lobster(
                                  textStyle: TextStyle(
                                      fontSize: 200,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                          TextSpan(
                            text: ' Effect',
                            style:
                                TextStyle(fontSize: 200, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          MouseRegion(
            onHover: _updateLocation,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ],
      ),
    );
  }
}

class Clipper extends CustomClipper<Rect> {
  Clipper(this.percentage);

  final double percentage;

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * percentage, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
