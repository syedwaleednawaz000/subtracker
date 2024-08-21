import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthProvider with ChangeNotifier {
  final LocalAuthentication auth = LocalAuthentication();
  bool? canCheckBiometrics;
  List<BiometricType>? availableBiometrics;
  String authorized = 'Not Authorized';
  bool isAuthenticating = false;

  LocalAuthProvider() {
    _checkBiometrics();
    _getAvailableBiometrics();
  }

  Future<void> _checkBiometrics() async {
    bool canCheck;
    try {
      canCheck = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheck = false;
      print(e);
    }
    canCheckBiometrics = canCheck;
    notifyListeners();
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> biometrics;
    try {
      biometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      biometrics = <BiometricType>[];
      print(e);
    }
    availableBiometrics = biometrics;
    notifyListeners();
  }

  Future<void> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      isAuthenticating = true;
      authorized = 'Authenticating';
      notifyListeners();

      if (availableBiometrics?.contains(BiometricType.strong) ?? false) {
        authenticated = await auth.authenticate(
          localizedReason: 'Please authenticate using Face ID or Fingerprint',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
      } else if (availableBiometrics?.contains(BiometricType.weak) ?? false) {
        authenticated = await auth.authenticate(
          localizedReason: 'Please authenticate using available biometrics',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
      }

      isAuthenticating = false;
      authorized = authenticated ? 'Authorized' : 'Not Authorized';
    } on PlatformException catch (e) {
      print(e);
      isAuthenticating = false;
      authorized = 'Error - ${e.message}';
    }
    notifyListeners();
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
    isAuthenticating = false;
    notifyListeners();
  }
}
