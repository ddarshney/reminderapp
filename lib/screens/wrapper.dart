import 'package:flutter/material.dart';
import 'package:remindmeapp/screens/authentication/authentication.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:remindmeapp/screens/home/home.dart';
import 'package:remindmeapp/models/user_data.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or authentication
    final user = Provider.of<TheUser>(context);
    print(user);
    if (user == null)
      return Authenticate();
    else
      return Home();
  }
}
