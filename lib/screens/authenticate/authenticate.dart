import 'package:flutter/material.dart';
import 'package:quiz_app_v1/screens/authenticate/sign_in.dart';
import 'package:quiz_app_v1/screens/authenticate/sign_up.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isSignIn = true;
  void toggleView(){
    setState(() {
      isSignIn = !isSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return isSignIn? SignIn(toggleView : toggleView) : SignUp(toggleView :toggleView);
  }
}
