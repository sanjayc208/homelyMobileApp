import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homely_mobile_app/pages/login.dart';
import 'package:homely_mobile_app/utils/authentication.dart';
import 'package:homely_mobile_app/widgets/footer_nav_bar.dart';
import 'package:homely_mobile_app/widgets/header_home.dart';
import 'package:homely_mobile_app/widgets/banner.dart';
import 'package:homely_mobile_app/widgets/popular_items_list.dart';
import 'package:homely_mobile_app/widgets/items_list.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late final dynamic _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Container(
              child: Stack(
                children: [
                  // CustomPaint(
                  //   size: Size(
                  //       width,
                  //       (width *
                  //           0.7013333129882813)), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  //   painter: RPSCustomPainter(),
                  // ),
                  ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.3,
                      color: Colors.red.shade600,
                      // child: Image(image: AssetImage('assets/photos/background_image.jpg' )),
                    ),
                    clipper: Clipper(),
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                HeaderHome(user: _user),
                OfferBanner(),
                SizedBox(height: 40),
                PopularItemList(),
                SizedBox(height: 10),
                ItemsList(),
              ],
            )
          ]),
        ),
        bottomNavigationBar: SizedBox(height: 62, child: FooterNavBar()));
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 255, 86, 89)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6200000, 0);
    path_0.quadraticBezierTo(size.width * 0.7947917, size.height * 0.5253571, 0,
        size.height * 0.6442857);
    path_0.quadraticBezierTo(
        size.width * -0.0052083, size.height * 0.5535714, 0, 0);

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 10);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
