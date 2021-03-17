import 'package:remindmeapp/screens/home/Club.dart';
import 'package:remindmeapp/screens/home/Student/pages/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    if (user == null)
      return Authenticate();
    else
      return StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users")
              .doc(user.uid)
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot>snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final userData = snapshot.data.data();
              if (userData['groupvalue'] == "Student")
                return Student();
              else if (userData['groupvalue'] == "Club member")
                return Club();
            }
            return Material(
              child: Center(child: CircularProgressIndicator(),),);
          }
      );
  }
}