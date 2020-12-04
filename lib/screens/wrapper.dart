import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_v1/models/my_user.dart';
import 'package:quiz_app_v1/screens/authenticate/authenticate.dart';
import 'package:quiz_app_v1/screens/authenticate/sign_up.dart';
import 'package:quiz_app_v1/screens/home/home.dart';

import 'authenticate/sign_in.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget
    final user = Provider.of<MyUser>(context);
    return (user == null) ? Authenticate(): Home();
  }
}
