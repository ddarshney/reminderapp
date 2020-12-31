import 'package:firebase_auth/firebase_auth.dart';
import 'package:remindmeapp/models/user_data.dart';

class AuthService {
  //_ in the beginning means private prop
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //anonymous sign in using future ie it appears later
  //create user object based on firebased user
  TheUser _fromFirebaseUser(User user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<TheUser> get user {
    // ignore: deprecated_member_use
    return _auth.authStateChanges().map((User user) => _fromFirebaseUser(user));
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //email password sign in
  Future signinwithemailpassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register
  Future registerwithemailpassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
