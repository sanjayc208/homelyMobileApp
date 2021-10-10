// ignore_for_file: await_only_futures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homely_mobile_app/utils/authentication.dart';
import 'package:homely_mobile_app/utils/custom_colors.dart';
import 'package:homely_mobile_app/widgets/google_signin_button.dart';
import 'package:homely_mobile_app/widgets/facebook_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:country_code_picker/country_code_picker.dart';
class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final myController = TextEditingController();
  bool _isSigningIn = false;
  String countryCode = '+91' ;
  bool textFieldExist = false;

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
            height: 100,
            width: 300,
            child:Row(
               children: <Widget>[
                      Expanded(
                        flex: 0,
                        child: CountryCodePicker(
                            onChanged: (c) => countryCode = c as String,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            favorite: ['+91','IN'],
                            initialSelection: 'IN',
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                      ),
                      Expanded(
                        flex: 2,
                        child: new TextField(
                          controller: myController,
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.0
                          ),
                          decoration: new InputDecoration(labelText: "Enter your number"),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          new ElevatedButton(
              onPressed: () async {
                if(myController.text.length <= 8){
                  ScaffoldMessenger.of(context).showSnackBar(
                        Authentication.customSnackBar(
                          content: 'Please add Proper Mobile Number',
                        ),
                    );
                    return null;
                }
                FirebaseAuth auth = FirebaseAuth.instance;
                setState(() {
                  _isSigningIn = true;
                });

                await auth.verifyPhoneNumber(
                  phoneNumber: countryCode + ' ' + myController.text,
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        Authentication.customSnackBar(
                          content: 'failed to verify mobile',
                        ),
                    );
                  },
                  codeSent: (String verificationId, int? resendToken) async {
                    Navigator.pushNamed(context, '/otp', arguments: {"phoneNumber": myController.text , "verificationId": verificationId});
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );

                setState(() {
                  _isSigningIn = false;
                });
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
                return (Center(
                  child: new Column(
                    children: <Widget>[ FacebookSignInButton() , GoogleSignInButton() ]
                    )
                  ));
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
