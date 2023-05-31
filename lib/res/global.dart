import 'package:flutter/cupertino.dart';

class Global{
  static bool isDark = true;
  static bool isVisited = false;
  static bool isLogged = false;
  static List<String> timeList = [];
  static List<String> thoughtList = [];
  static int num = 1;

  static DateTime dateTime = DateTime.now();
  static String? thought;
  static TextEditingController thoughtController = TextEditingController();
}