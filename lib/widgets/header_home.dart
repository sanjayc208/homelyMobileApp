import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return AppBar(
          elevation: 0,
          title: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 22.0,
                backgroundImage:
                    NetworkImage( _user?.photoURL ?? "https://static.wixstatic.com/media/c7637f_11672039570147b18e44cf9010240bc4~mv2.png/v1/fill/w_266,h_266,al_c,q_85,usm_0.66_1.00_0.01/dummy%20profile%20pic.webp"),
                backgroundColor: Colors.transparent,
              ),
            ]
          ),
          automaticallyImplyLeading: false,
        );
  }
}