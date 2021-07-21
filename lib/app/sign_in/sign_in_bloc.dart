import 'dart:async';

import 'package:andrea/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class SignInBloc {
  final AuthBase auth;
  final StreamController<bool> _isLoadingController = StreamController<bool>();

  SignInBloc({@required this.auth});

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  Future<User> signInAnonymously() async => _signIn(auth.signInAnonymously);

  Future<User> signInWithGoogle() async => _signIn(auth.signInWithGoogle);

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      _setIsLoading(false);
      rethrow;
    }
  }
}
