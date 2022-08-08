import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintAuth {
  static final LocalAuthentication auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      print("Has biometri func called");
      return await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print("Error hasBiometrics: $e");
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print("Error getBiometrics: $e");
      return <BiometricType>[];
    }
  }

  static Future<bool> isDeviceSupported() async {
    return await auth.isDeviceSupported();
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (isAvailable)
      try {
        return await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
      } on PlatformException catch (e) {
        print("Error authenticate: $e");
        return false;
      }
    return false;
  }

}
