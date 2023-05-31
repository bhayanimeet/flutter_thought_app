import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practical_test/views/screens/homepage.dart';
import '../../../controllers/google_ads_controller.dart';
import '../../../res/global.dart';
import '../../controllers/local_notification_controller.dart';
import 'intro_1.dart';
import 'loginscreen.dart';
// import 'homepage.dart';
// import 'intro_1.dart';
// import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    LocalPushNotificationHelper.localPushNotificationHelper
        .initializeLocalPushNotification();
    Timer(
      const Duration(seconds: 6),
          () => Get.off(
            () => (Global.isVisited == false)
            ? const IntroScreen1()
            : (Global.isLogged == false)
            ? const LoginScreen()
            : const HomePage(),
        curve: Curves.easeInOut,
        transition: Transition.cupertino,
      ),
    );
    AdHelper.adHelper.loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.deepPurpleAccent.shade400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              filterQuality: FilterQuality.high,
              scale: 2.1,
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Thoughts app",
                  curve: Curves.easeInOut,
                  cursor: '',
                  speed: const Duration(milliseconds: 300),
                  textStyle: GoogleFonts.arya(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
