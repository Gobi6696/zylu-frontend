import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  User? _firebaseUser;
  AppUser? _appUser;
  bool _isLoading = true;

  User? get firebaseUser => _firebaseUser;
  AppUser? get appUser => _appUser;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _firebaseUser != null;

  AuthProvider() {
    _init();
  }

  Future<void> _init() async {
    _authService.authStateChanges.listen((user) async {
      _firebaseUser = user;
      if (user != null) {
        _appUser = await _authService.getCurrentAppUser();
      } else {
        _appUser = null;
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<String?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    final error = await _authService.signUpWithEmail(
      name: name,
      email: email,
      password: password,
    );

    _isLoading = false;
    notifyListeners();
    return error;
  }

  Future<String?> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final error = await _authService.signInWithEmail(
      email: email,
      password: password,
    );

    _isLoading = false;
    notifyListeners();
    return error;
  }

  Future<String?> loginWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    final error = await _authService.signInWithGoogle();

    _isLoading = false;
    notifyListeners();
    return error;
  }

  Future<void> logout() async {
    await _authService.signOut();
  }
}
