import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import 'home_screen.dart';

class HomePageAuthCheck extends StatefulWidget {
  const HomePageAuthCheck({Key? key}) : super(key: key);

  @override
  State<HomePageAuthCheck> createState() => _HomePageAuthCheckState();
}

class _HomePageAuthCheckState extends State<HomePageAuthCheck> {
  bool? _hasBioSensor;
  //List<BiometricType>? _availableBiometrics;

  // final String _isAuthorized = "NOT Authorized";

  LocalAuthentication authentication = LocalAuthentication();

  //Function to check if biometrics is available or not
  Future<void> _checkForBiometric() async {
    //bool? hasBiometrics;

    try {
      _hasBioSensor = await authentication.canCheckBiometrics;
      print(_hasBioSensor);
      if (_hasBioSensor!) {
        _getAuthentication();
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

// function to check if user is authorized or not

  Future<void> _getAuthentication() async {
    bool isAutherized = false;
    try {
      isAutherized = await authentication.authenticate(
          localizedReason: "SCAN YOUR FIINGER",
          options: const AuthenticationOptions(
              biometricOnly: false, stickyAuth: true, useErrorDialogs: true));

      if (isAutherized) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (builder) => const HomeScreen()));
      }

      print(isAutherized);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkForBiometric();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fingerprint in flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Is Biometric available? :$_hasBiometricsSenson"),
            ElevatedButton(
                onPressed: () {
                  _checkForBiometric();
                },
                child: const Text("check")),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
