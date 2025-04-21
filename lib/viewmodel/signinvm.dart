import 'package:flutter/material.dart';

import '../models/signinmodel.dart';

class SignInViewModel extends ChangeNotifier {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final orgIdController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void signIn() {
    _isLoading = true;
    notifyListeners();

    // Simulate a network call
    Future.delayed(Duration(seconds: 2), () {
      _isLoading = false;
      notifyListeners();
    });
  }

  SignInModel get signInModel {
    return SignInModel(
      username: userNameController.text,
      password: passwordController.text,
      orgId: orgIdController.text,
    );
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    orgIdController.dispose();
    super.dispose();
  }
}
