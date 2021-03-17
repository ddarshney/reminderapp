
import './First.dart' as first;
import './Second.dart' as second;
import './Third.dart' as third;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:remindmeapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:remindmeapp/services/auth.dart';
import 'package:remindmeapp/screens/home/user_list.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  final AuthService _auth = AuthService();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            drawer: Drawer(),
            appBar: AppBar(
              title: new Text("Student-Reminders", style: TextStyle(fontSize: 16.0),),

              centerTitle: true,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                    child : FlatButton.icon(
                      icon: Icon(Icons.person),
                      label: Text('LOGOUT'),
                      onPressed: () async {
                        await _auth.signOut();
                      },
                    )
                ),
              ],
              elevation: 0.0,

              bottom: TabBar(
                tabs: [
                  Tab(icon: Text('Tasks')),
                  Tab(icon: Text('Feed')),
                  Tab(icon: Text('Clubs')),

                ],
              ),
              backgroundColor: Colors.deepPurpleAccent,
            ),
            bottomNavigationBar: new Material(
                color: Colors.pink,
                child: new TabBar(

                    tabs: <Tab>[
                      new Tab(icon: new Icon(Icons.add_alarm_outlined)),
                      new Tab(icon: new Icon(Icons.add_alert_rounded)),
                      new Tab(icon: new Icon(Icons.app_registration)),
                    ]
                )
            ),
            body: new TabBarView(
                children: <Widget>[
                  new first.TodoApp(),
                  new second.Second(),
                  new third.Third()
                ]
            )

        ),


      ),
    );

  }
}
