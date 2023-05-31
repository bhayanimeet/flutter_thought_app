import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practical_test/views/screens/add_thought.dart';
import 'package:practical_test/views/screens/preview_page.dart';
import '../../controllers/google_ads_controller.dart';
import '../../res/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            toolbarHeight: 60,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(25)),
                color: (Global.isDark == true)
                    ? const Color(0xff35313f)
                    : const Color(0xffe9e2f1),
              ),
              child: FlexibleSpaceBar(
                expandedTitleScale: 1,
                title: Row(
                  children: [
                    Expanded(
                      flex: 11,
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: Text(
                          "Digital clock",
                          style: GoogleFonts.arya(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Global.isDark == true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.to(
                                  () => const PreviewPage(),
                                duration: const Duration(seconds: 2),
                                transition: Transition.fadeIn,
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const Icon(Icons.list,size: 25),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Get.changeThemeMode(
                                (Get.isDarkMode == true)
                                    ? ThemeMode.light
                                    : ThemeMode.dark,
                              );
                              setState(() {
                                Global.isDark = !Global.isDark;
                              });
                            },
                            child:
                            const Icon(Icons.light_mode_outlined),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                titlePadding: const EdgeInsets.only(left: 20, bottom: 10),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 110),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: AnalogClock(
                      isLive: true,
                      datetime: Global.dateTime,
                      digitalClockColor: (Global.isDark == true)?Colors.white:Colors.black,
                      hourHandColor: (Global.isDark == true)?Colors.white:Colors.black,
                      minuteHandColor: (Global.isDark == true)?Colors.white:Colors.black,
                      secondHandColor: Colors.red.shade800,
                      numberColor: (Global.isDark == true)?Colors.white:Colors.black,
                      textScaleFactor: 1.4,
                      tickColor: (Global.isDark == true)?Colors.white54:Colors.black54,
                      showAllNumbers: true,
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Global.dateTime = DateTime.now();
                        Global.timeList.add(Global.dateTime.toString());

                        if (Global.num % 3 == 0) {
                          if (AdHelper.adHelper.interstitialAd != null) {
                            AdHelper.adHelper.interstitialAd!.show();
                            AdHelper.adHelper.loadInterstitialAd();
                          }
                          Get.to(
                                () => const AddThought(),
                            duration: const Duration(milliseconds: 1400),
                            transition: Transition.fadeIn,
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Get.to(
                                () => const AddThought(),
                            duration: const Duration(milliseconds: 1400),
                            transition: Transition.fadeIn,
                            curve: Curves.easeInOut,
                          );
                        }
                      });
                    },
                    child: Text(
                      "Mark your thoughts",
                      style: GoogleFonts.arya(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
