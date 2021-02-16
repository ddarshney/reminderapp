import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:remindmeapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:remindmeapp/services/auth.dart';
import 'user_list.dart';
class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
        value: DatabaseService().users,
        child:Scaffold(
          appBar: AppBar(
          title: Text('HOME'),
          backgroundColor: Colors.green,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('LOGOUT'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
          backgroundColor: Colors.white,
        body: UserList(),
        )
    );
  }
}

