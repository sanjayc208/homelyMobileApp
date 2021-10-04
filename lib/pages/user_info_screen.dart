import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homely_mobile_app/pages/login.dart';
import 'package:homely_mobile_app/utils/authentication.dart';
import 'package:homely_mobile_app/utils/custom_colors.dart';
import 'package:homely_mobile_app/widgets/footer_nav_bar.dart';
import 'package:homely_mobile_app/widgets/header_home.dart';
import 'package:homely_mobile_app/widgets/banner.dart';
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
    return Scaffold(
        backgroundColor: CustomColors.firebaseGrey,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: HeaderHome(user: _user)),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OfferBanner(),
                Row(),
                
                SizedBox(height: 16.0),
                Text(
                  'Hello',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _user?.displayName ?? "",
                  style: TextStyle(
                    color: CustomColors.firebaseYellow,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '( ${_user?.email ?? ""} )',
                  style: TextStyle(
                    color: CustomColors.firebaseOrange,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  'You are now signed in using your Google account. To sign out of your account click the "Sign Out" button below.',
                  style: TextStyle(
                      color: CustomColors.firebaseGrey.withOpacity(0.8),
                      fontSize: 14,
                      letterSpacing: 0.2),
                ),
                SizedBox(height: 16.0),
                _isSigningOut
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.redAccent,
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
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(height: 62, child: FooterNavBar()));
  }
}
