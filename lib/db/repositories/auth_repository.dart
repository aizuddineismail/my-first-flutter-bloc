import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get user => firebaseAuth.userChanges();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void signOut() {
    firebaseAuth.signOut();
  }
}
