import 'package:remindmeapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

enum SingingCharacter { clubmember, student }
SingingCharacter _character = SingingCharacter.clubmember;

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';
  String grpVal='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Sign up to Remind Me App'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 15.0),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Enter your e-mail ID'),
                validator: (val) => val.isEmpty ? 'No e-mail ID entered' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Enter your desired password'),
                obscureText: true,
                validator: (val) => val.length < 6
                    ? 'Enter a password with 6 or more characters'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              ListTile(
                title: const Text('Student'),
                leading: Radio(
                  activeColor: Colors.red,
                  hoverColor: Colors.red,
                  value: SingingCharacter.student,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      grpVal="student";
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Club'),
                leading: Radio(
                  activeColor: Colors.red,
                  hoverColor: Colors.red,
                  focusColor: Colors.red,
                  value: SingingCharacter.clubmember,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      grpVal="club member";
                      _character = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 15.0),
              RaisedButton(
                  color: Colors.blue[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerwithemailpassword(
                          email, password, grpVal);
                      if (result == null) {
                        setState(() {
                          error = 'Please enter a valid e-mail';
                        });
                      }
                    }
                  }),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 15.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
