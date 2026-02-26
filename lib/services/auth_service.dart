import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Current user
  User? get currentUser => _auth.currentUser;

  Future<AppUser?> getCurrentAppUser() async {
    final user = _auth.currentUser;
    if (user == null) return null;

    final doc = await _firestore.collection('users').doc(user.uid).get();
    if (doc.exists) {
      return AppUser.fromMap(doc.data()!);
    }
    return null;
  }

  // Email Sign Up
  Future<String?> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final appUser = AppUser(
        uid: credential.user!.uid,
        email: email.trim(),
        name: name.trim(),
        createdAt: DateTime.now(),
      );

      await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(appUser.toMap());

      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Sign up failed';
    } catch (e) {
      return e.toString();
    }
  }

  // Email Sign In
  Future<String?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Login failed';
    } catch (e) {
      return e.toString();
    }
  }

  // Google Sign In
  // Future<String?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) return 'Google sign in cancelled';
  //
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     final userCredential = await _auth.signInWithCredential(credential);
  //     final user = userCredential.user;
  //
  //     if (user == null) return 'Google sign in failed';
  //
  //     // Check if new user → create document
  //     final doc = await _firestore.collection('users').doc(user.uid).get();
  //     if (!doc.exists) {
  //       final appUser = AppUser(
  //         uid: user.uid,
  //         email: user.email,
  //         name: user.displayName ?? 'Google User',
  //         createdAt: DateTime.now(),
  //       );
  //       await _firestore.collection('users').doc(user.uid).set(appUser.toMap());
  //     }
  //
  //     return null;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }
  Future<String?> signInWithGoogle() async {
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();

      final userCredential = await _auth.signInWithProvider(googleProvider);
      final user = userCredential.user;

      if (user == null) return 'Google sign in failed';

      final doc = await _firestore.collection('users').doc(user.uid).get();

      if (!doc.exists) {
        final appUser = AppUser(
          uid: user.uid,
          email: user.email,
          name: user.displayName ?? 'Google User',
          createdAt: DateTime.now(),
        );

        await _firestore.collection('users').doc(user.uid).set(appUser.toMap());
      }

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() => _auth.signOut();
}
