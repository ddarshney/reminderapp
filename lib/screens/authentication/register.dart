import 'package:remindmeapp/services/auth.dart';
import 'package:flutter/material.dart';

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
  String type='Student';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 10.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('SIGN IN',
              style:TextStyle(fontWeight: FontWeight.bold,

              ),),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                  child: Text('Sign',
                      style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(18.0, 175.0, 0.0, 0.0),
                  child: Text('Up',
                      style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(110.0, 175.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(fontSize: 80.0,fontWeight: FontWeight.bold,color: Colors.green)),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'E-MAIL',
                        labelStyle:TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    validator: (val) => val.isEmpty ? 'NO E-MAIL ID ENTERED' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock), labelText: 'PASSWORD',
                        labelStyle:TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                    validator: (val) => val.length < 6
                        ? 'PASSWORD SHOULD HAVE 6 OR MORE CHARACTERS'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  ListTile(
                    title: const Text('STUDENT'),
                    leading: Radio(
                      value: SingingCharacter.student,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {

                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('CLUB MEMBER'),
                    leading: Radio(
                      value: SingingCharacter.clubmember,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          type='Club member';
                          _character = value;
                        });
                      },
                    ),
                  ),
                  RaisedButton(
                      color: Colors.green,
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result =
                          await _auth.registerwithemailpassword(email, password,type);
                          if (result == null) {
                            setState(() {
                              error = 'ERROR SIGNING UP';
                            });
                          }
                        }
                      }),

                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
