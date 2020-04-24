import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Provider/AuthBloc/signin_bloc.dart';
import 'package:volcano/Provider/AuthBloc/validators.dart';
import 'package:volcano/Screens/home_page.dart';
import 'package:volcano/Services/auth_service.dart';

class SignUpBloc with ChangeNotifier {
  String email;
  String password;
  String confirmPassword;
  bool validateEmail = true;
  bool validatePassword = true;
  bool validateConfirmPassword = true;
  final _authService = AuthService();
  final _validator = Validators();
  var _authStatus = AuthStatus.NOT_LOGGED_IN;
  var _userUID;

  AuthStatus get authStatus => _authStatus;
  get userUID => _userUID;

  void signUp(BuildContext context) {
    if (!_validator.validateEmailMessage(email)) {
      validateEmail = false;
      notifyListeners();
    } else if (!_validator.validatePasswordMessage(password)) {
      validatePassword = false;
      notifyListeners();
    } else if (password != confirmPassword) {
      validateConfirmPassword = false;
      notifyListeners();
    } else {
      _authStatus = AuthStatus.NOT_DETERMINED;
      notifyListeners();
      validateEmail = true;
      validatePassword = true;
      validateConfirmPassword = true;
      notifyListeners();
      _authService.signUp('$email', '$password', context).then(
        (String uid) {
          _userUID = uid;
          _authStatus = AuthStatus.LOGGED_IN;
          notifyListeners();
          routePush(HomePage(), RouterType.fade);
        },
      );
    }
  }
}
