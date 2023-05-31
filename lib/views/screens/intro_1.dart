import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'intro_2.dart';
import 'loginScreen.dart';

class IntroScreen1 extends StatefulWidget {
  const IntroScreen1({Key? key}) : super(key: key);

  @override
  State<IntroScreen1> createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    prefs.setBool('isVisited', true);
                    Get.off(
                          () => const LoginScreen(),
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      transition: Transition.fadeIn,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Skip",
                        style: GoogleFonts.play(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/images/1.png',
              scale: 0.7,
              repeat: ImageRepeat.repeat,
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
            ),
            const SizedBox(height: 30),
            Text(
              "Your new Experience",
              style: GoogleFonts.play(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Be anywhere and store your ideas for future.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Container(
                    height: 15,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Container(
                  height: 15,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    shape: BoxShape.circle,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                            () => const IntroScreen2(),
                        curve: Curves.easeInOut,
                        transition: Transition.rightToLeft,
                        duration: const Duration(seconds: 1),
                      );
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}