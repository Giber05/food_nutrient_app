import 'package:FoodNutrient/core/utils/fingerprint_auth/fingerprint_auth.dart';
import 'package:FoodNutrient/features/authenticated/presentation/screens/homescreen/homescreen.dart';
import 'package:FoodNutrient/main.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sizer/sizer.dart';

class FingerprintAuthScreen extends StatefulWidget {
  const FingerprintAuthScreen({Key? key}) : super(key: key);

  @override
  State<FingerprintAuthScreen> createState() => _FingerprintAuthScreenState();
}

class _FingerprintAuthScreenState extends State<FingerprintAuthScreen> {
  bool isAuthenticating = false;
  bool isInitAuth = true;
  bool isDeviceSupported = false;

  @override
  void initState() {
    super.initState();
    FingerprintAuth.isDeviceSupported().then((value) async {
      if (!value)
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text("There are no divice security enrolled"),
              content: Text(
                  "Enroll your device security first to authenticate the app"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    AppSettings.openSecuritySettings();
                  },
                  child: const Text('Open Setting'),
                ),
              ],
            );
          },
        );
      else {
        FingerprintAuth.authenticate().then((value) {
          if (value) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainPage()),
            );

            return;
          } else {
            setState(() {
              isInitAuth = false;
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (!isDeviceSupported)
    //   Future.delayed(
    //       Duration.zero,
    // () => showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //           title: Text("There are no divice security enrolled"),
    //           content: Text(
    //               "Enroll your device security first to authenticate the app"),
    //           actions: <Widget>[
    //             TextButton(
    //               onPressed: () => Navigator.of(context).pop(),
    //               child: const Text('Exit App'),
    //             ),
    //           ],
    //         );
    //       },
    //     ));
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(3.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      if (!isInitAuth) buildAuthenticate(context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAvailability(BuildContext context) => buildButton(
        text: 'Check Availability',
        icon: Icons.event_available,
        onClicked: () async {
          final isAvailable = await FingerprintAuth.hasBiometrics();
          final biometrics = await FingerprintAuth.getBiometrics();

          final hasFingerprint = biometrics.contains(BiometricType.fingerprint);

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Availability'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildText('Biometrics', isAvailable),
                  buildText('Fingerprint', hasFingerprint),
                ],
              ),
            ),
          );
        },
      );

  Widget buildText(String text, bool checked) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            checked
                ? Icon(Icons.check, color: Colors.green, size: 24)
                : Icon(Icons.close, color: Colors.red, size: 24),
            const SizedBox(width: 12),
            Text(text, style: TextStyle(fontSize: 24)),
          ],
        ),
      );

  Widget buildAuthenticate(BuildContext context) => buildButton(
        text: 'Login',
        icon: Icons.lock_open,
        onClicked: () async {
          final isAuthenticated = await FingerprintAuth.authenticate();

          if (isAuthenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          }
        },
      );

  Widget buildButton({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
        ),
        icon: Icon(icon, size: 26),
        label: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
      );
}
