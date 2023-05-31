import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../../controllers/firebase_login_controller.dart';
import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  String? email;
  String? password;

  bool isVisible = true;

  String status = "Register";
  String line = "Create your account";
  String logIn = "Sign Up";
  String account = "Already account?";
  String signIn = " Sign in";

  bool isSignUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xff512da8),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          status,
                          style: GoogleFonts.arya(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          line,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 600,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade500,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(-1,-1),
                        ),
                      ],
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            controller: emailController,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            enableSuggestions: true,
                            showCursor: false,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.play(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            onSaved: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter email first...";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white, width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white, width: 1)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white, width: 1)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white, width: 1)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white, width: 1)),
                              focusColor: Colors.white,
                              labelText: "Email",
                              labelStyle:
                              GoogleFonts.arya(fontSize: 25, color: Colors.white),
                              hintText: "Enter Email",
                              prefixIcon: const Icon(Icons.email_outlined,
                                  color: Colors.white, size: 28),
                              errorStyle: GoogleFonts.play(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              hintStyle: GoogleFonts.play(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            enableSuggestions: true,
                            showCursor: false,
                            obscureText: isVisible,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.play(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            onSaved: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter Password first...";
                              }
                              return null;
                            },
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                child: Icon(
                                  (isVisible == true)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white, width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white, width: 1)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white, width: 1)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white, width: 1)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white, width: 1)),
                              focusColor: Colors.white,
                              labelText: "Password",
                              labelStyle:
                              GoogleFonts.arya(fontSize: 25, color: Colors.white),
                              hintText: "Enter Password",
                              prefixIcon:
                              const Icon(Icons.lock_outline, color: Colors.white),
                              errorStyle: GoogleFonts.play(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              hintStyle: GoogleFonts.play(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () async {
                                await FirebaseHelper.firebaseAuth
                                    .sendPasswordResetEmail(email: email!);
                              },
                              child: Text(
                                "Forgot password ?",
                                style: GoogleFonts.arya(
                                  fontSize: 20,
                                  color: Colors.purple.shade200,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              if (isSignUp == true) {
                                Map<String, dynamic> res = await FirebaseHelper
                                    .firebaseHelper
                                    .signUp(email: email!, password: password!);

                                if (res['user'] != null) {
                                  SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                                  await prefs.setBool('isLogged', true);
                                  Get.off(
                                        () => const HomePage(),
                                    duration: const Duration(seconds: 2),
                                    curve: Curves.easeInOut,
                                    transition: Transition.fadeIn,
                                  );
                                } else if (res['error'] != null) {
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      title: 'Error',
                                      backgroundColor: Colors.deepPurpleAccent.shade200,
                                      snackPosition: SnackPosition.BOTTOM,
                                      borderRadius: 20,
                                      duration: const Duration(seconds: 2),
                                      margin: const EdgeInsets.all(15),
                                      message: res['error'],
                                      snackStyle: SnackStyle.FLOATING,
                                    ),
                                  );
                                } else {
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      title: 'Error',
                                      backgroundColor: Colors.deepPurpleAccent.shade200,
                                      snackPosition: SnackPosition.BOTTOM,
                                      borderRadius: 20,
                                      duration: const Duration(seconds: 2),
                                      margin: const EdgeInsets.all(15),
                                      message: 'Please check internet connection...',
                                      snackStyle: SnackStyle.FLOATING,
                                    ),
                                  );
                                }
                              } else if (isSignUp == false) {
                                Map<String, dynamic> res = await FirebaseHelper
                                    .firebaseHelper
                                    .signIn(email: email!, password: password!);

                                if (res['user'] != null) {
                                  SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                                  await prefs.setBool('isLogged', true);
                                  Get.off(
                                        () => const HomePage(),
                                    duration: const Duration(seconds: 2),
                                    curve: Curves.easeInOut,
                                    transition: Transition.fadeIn,
                                  );
                                } else if (res['error'] != null) {
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      title: 'Error',
                                      backgroundColor: Colors.deepPurpleAccent.shade200,
                                      snackPosition: SnackPosition.BOTTOM,
                                      borderRadius: 20,
                                      duration: const Duration(seconds: 2),
                                      margin: const EdgeInsets.all(15),
                                      message: res['error'],
                                      snackStyle: SnackStyle.FLOATING,
                                    ),
                                  );
                                } else {
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      title: 'Error',
                                      backgroundColor: Colors.deepPurpleAccent.shade200,
                                      snackPosition: SnackPosition.BOTTOM,
                                      borderRadius: 20,
                                      duration: const Duration(seconds: 2),
                                      margin: const EdgeInsets.all(15),
                                      message: 'Please check internet connection...',
                                      snackStyle: SnackStyle.FLOATING,
                                    ),
                                  );
                                }
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                color: Colors.deepPurple.shade700,
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(10)),
                                shadowLightColor: Colors.transparent,
                                surfaceIntensity: 0.5,
                                lightSource: LightSource.bottomLeft,
                                oppositeShadowLightSource: true,
                              ),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade400,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Align(
                                  alignment: const Alignment(0, -0.2),
                                  child: Text(
                                    logIn,
                                    style: GoogleFonts.arya(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 140,
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "OR",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 8),
                            SizedBox(
                              width: 140,
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              Map<String, dynamic> res = await FirebaseHelper
                                  .firebaseHelper
                                  .signInWithGoogle();

                              if (res['user'] != null) {
                                SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                                await prefs.setBool('isLogged', true);
                                Get.off(
                                      () => const HomePage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              } else if (res['error'] != null) {
                                Get.showSnackbar(
                                  GetSnackBar(
                                    title: 'Error',
                                    backgroundColor: Colors.deepPurpleAccent.shade200,
                                    snackPosition: SnackPosition.BOTTOM,
                                    borderRadius: 20,
                                    duration: const Duration(seconds: 2),
                                    margin: const EdgeInsets.all(15),
                                    message: res['error'],
                                    snackStyle: SnackStyle.FLOATING,
                                  ),
                                );
                              } else {
                                Get.showSnackbar(
                                  GetSnackBar(
                                    title: 'Error',
                                    backgroundColor: Colors.deepPurpleAccent.shade200,
                                    snackPosition: SnackPosition.BOTTOM,
                                    borderRadius: 20,
                                    duration: const Duration(seconds: 2),
                                    margin: const EdgeInsets.all(15),
                                    message: 'Please check network connection...',
                                    snackStyle: SnackStyle.FLOATING,
                                  ),
                                );
                              }
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                color: Colors.deepPurple,
                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(10)),
                                shadowLightColor: Colors.transparent,
                                surfaceIntensity: 0.5,
                                lightSource: LightSource.bottomLeft,
                                oppositeShadowLightSource: true,
                              ),
                              child: Container(
                                height: 47,
                                width: 120,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/google.png',
                                        height: 25, filterQuality: FilterQuality.high),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Google",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              account,
                              style: GoogleFonts.arya(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSignUp == false) {
                                    isSignUp = true;
                                    status = "Register";
                                    line = "Create your account";
                                    logIn = "Sign Up";
                                    account = "Already account?";
                                    signIn = " Sign In";
                                  } else if (isSignUp == true) {
                                    isSignUp = false;
                                    status = "Welcome back!";
                                    line = "Login to your account";
                                    logIn = "Sign In";
                                    account = "Don't have an account?";
                                    signIn = " Create new";
                                  }
                                });
                              },
                              child: Text(
                                signIn,
                                style: GoogleFonts.arya(
                                  fontSize: 18,
                                  color: Colors.purple.shade200,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}