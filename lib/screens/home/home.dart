import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:remindmeapp/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remind Me App'),
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      backgroundColor: Colors.blue[50],
    );
  }
}
