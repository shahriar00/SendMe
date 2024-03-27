import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;


  // SignIn Process ......................
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }


  
  // SignUp Process ......................
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }


  // Signout .................
  Future<void>signOut() async{ 
    return await auth.signOut();
  }



}
