import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homely_mobile_app/utils/authentication.dart';
import 'package:homely_mobile_app/pages/login.dart';

/// This is the stateful widget that the main application instantiates.
class HeaderHome extends StatefulWidget {
  const HeaderHome({Key? key ,required User user}) 
   : _user = user,
        super(key: key);

  final User _user;

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

/// This is the private State class that goes with HeaderHome.
class _HeaderHomeState extends State<HeaderHome> {
  late final User? _user;
  bool _isSigningOut = false;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

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
  Widget build(BuildContext context) {

    return AppBar(
          elevation: 0,
          backgroundColor: Colors.red.shade600,
          title: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 22.0,
                backgroundImage:
                    NetworkImage( _user?.photoURL ?? "https://static.wixstatic.com/media/c7637f_11672039570147b18e44cf9010240bc4~mv2.png/v1/fill/w_266,h_266,al_c,q_85,usm_0.66_1.00_0.01/dummy%20profile%20pic.webp"),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 2.05),
              _isSigningOut
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black87,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            _isSigningOut = true;
                          });
                          await Authentication.signOut(context: context);
                          setState(() {
                            _isSigningOut = false;
                          });
                          Navigator.of(context)
                              .pushReplacement(_routeToSignInScreen());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            'Sign Out',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
            ]
          ),
          automaticallyImplyLeading: false,
        );
  }
}