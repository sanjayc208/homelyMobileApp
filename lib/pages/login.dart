import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>  {
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
          SizedBox(height: 20),
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
              onPressed: () { Navigator.pushNamed(context, '/otp', arguments: <String, String>{"phoneNumber":myController.text});},
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
              child: Text("Send OTP", style: TextStyle(fontSize: 18))),
          SizedBox(height: 100)
        ],
      )),
    );
  }
}
