import 'package:firebase_auth/firebase_auth.dart';
class Auth{
  final FirebaseAuth _auth;
Auth(this._auth);
//Stream<User>? get authStateChanges=>_auth.authStateChanges;
Future<String?>signin(String email,String password) async {
  try{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return "Sign-in";
  }on FirebaseAuthException catch (e){
    return e.message;}
}
  Future<String?>signup(String email,String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Sign up";
    }on FirebaseAuthException catch (e){
      return e.message;}
  }
}