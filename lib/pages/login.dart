import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homely_mobile_app/utils/authentication.dart';
import 'package:homely_mobile_app/utils/custom_colors.dart';
import 'package:homely_mobile_app/widgets/google_signin_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
          // padding: const EdgeInsets.all(70.0),
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage('assets/photos/homely_logo.png')),
          // SizedBox(height: 10),
          SizedBox(
            height: 80,
            width: 280,
            child: new TextField(
              controller: myController,
              decoration: new InputDecoration(labelText: "Enter your number"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          new ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/otp',
                    arguments: {"phoneNumber": myController.text});
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(280, 50),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
              child: Text("Login with OTP", style: TextStyle(fontSize: 18))),
          SizedBox(height: 20),
          new Text(
              "--------------------------- or ---------------------------"),
          SizedBox(height: 20),
          FutureBuilder(
            future: Authentication.initializeFirebase(context: context),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error initializing Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return GoogleSignInButton();
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  CustomColors.firebaseOrange,
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
