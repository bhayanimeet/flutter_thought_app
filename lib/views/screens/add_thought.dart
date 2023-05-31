import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:practical_test/controllers/local_notification_controller.dart';
import 'package:practical_test/views/screens/homepage.dart';
import 'package:practical_test/views/screens/preview_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../res/global.dart';

class AddThought extends StatefulWidget {
  const AddThought({Key? key}) : super(key: key);

  @override
  State<AddThought> createState() => _AddThoughtState();
}

class _AddThoughtState extends State<AddThought> {
  GlobalKey<FormState> insertKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            toolbarHeight: 80,
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
                background: Align(
                  alignment: const Alignment(-0.89, -0.4),
                  child: Text(
                    "Add",
                    style: GoogleFonts.arya(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color:
                          Global.isDark == true ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      flex: 11,
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: Text(
                          "Add your thought",
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
                  ],
                ),
                titlePadding: const EdgeInsets.only(left: 20, bottom: 10),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  Form(
                    key: insertKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          TextFormField(
                            controller: Global.thoughtController,
                            style: GoogleFonts.play(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                            enableSuggestions: true,
                            textInputAction: TextInputAction.next,
                            onSaved: (val) {
                              setState(() {
                                Global.thought = val!;
                                Global.thoughtList.add(Global.thought!);
                              });
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter your thought first...';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: (Get.isDarkMode == true)
                                          ? Colors.white
                                          : Colors.black,
                                      width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: (Get.isDarkMode == true)
                                          ? Colors.white
                                          : Colors.black,
                                      width: 1)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: (Get.isDarkMode == true)
                                          ? Colors.white
                                          : Colors.black,
                                      width: 1)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: (Get.isDarkMode == true)
                                          ? Colors.white
                                          : Colors.black,
                                      width: 1)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: (Get.isDarkMode == true)
                                          ? Colors.white
                                          : Colors.black,
                                      width: 1)),
                              hintText: 'Enter your thought',
                              hintStyle: GoogleFonts.play(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                              labelText: 'Thought',
                              labelStyle: GoogleFonts.arya(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                              errorStyle: GoogleFonts.play(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: TextFormField(
                      style: GoogleFonts.play(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      readOnly: true,
                      enableSuggestions: true,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: (Get.isDarkMode == true)
                                    ? Colors.white
                                    : Colors.black,
                                width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: (Get.isDarkMode == true)
                                    ? Colors.white
                                    : Colors.black,
                                width: 1)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: (Get.isDarkMode == true)
                                    ? Colors.white
                                    : Colors.black,
                                width: 1)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: (Get.isDarkMode == true)
                                    ? Colors.white
                                    : Colors.black,
                                width: 1)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: (Get.isDarkMode == true)
                                    ? Colors.white
                                    : Colors.black,
                                width: 1)),
                        hintText: "${(Global.dateTime.hour<10)?"0${Global.dateTime.hour}":Global.dateTime.hour} : ${(Global.dateTime.minute<10)?"0${Global.dateTime.minute}":Global.dateTime.minute} : ${(Global.dateTime.second<10)?"0${Global.dateTime.second}":Global.dateTime.second}",
                        hintStyle: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: ()async{
              if(insertKey.currentState!.validate()){
                insertKey.currentState!.save();

                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setStringList('thought', Global.thoughtList);
                await prefs.setStringList('time', Global.timeList);

                Get.off(
                    () => const HomePage(),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  transition: Transition.fadeIn,
                );

                setState(() {
                  Global.num++;
                });

                Get.showSnackbar(
                  GetSnackBar(
                    title: 'Task',
                    backgroundColor: Colors.indigo.shade300,
                    snackPosition: SnackPosition.BOTTOM,
                    borderRadius: 20,
                    duration: const Duration(seconds: 2),
                    margin: const EdgeInsets.all(15),
                    message: 'Your added in list...',
                    snackStyle: SnackStyle.FLOATING,
                  ),
                );

                await LocalPushNotificationHelper.localPushNotificationHelper.showSimpleNotification();

                setState(() {
                  Global.thoughtController.clear();
                  Global.thought = null;
                });
              }
            },
            icon: const Icon(Icons.add),
            label: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
