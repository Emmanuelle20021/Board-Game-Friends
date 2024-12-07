import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  AuthService._();

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = credential.user;
      return user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = credential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('El email ya está en uso');
      }
      rethrow;
    }
  }

  static Future<User> signInWithGoogle() async {
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();
      final UserCredential credential =
          await _auth.signInWithPopup(googleProvider);
      return credential.user!;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  static Future sendPasswordReset(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future updatePassword(String password) async {
    try {
      User? user = _auth.currentUser;
      return await user!.updatePassword(password);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<void> sendEmailVerification() async {
    User? user = _auth.currentUser;
    if (user != null && !user.emailVerified) await user.sendEmailVerification();
  }

  static get isEmailVerified {
    User? user = _auth.currentUser;
    return user != null && user.emailVerified;
  }
}
