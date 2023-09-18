

import 'package:flutter/material.dart';
import 'package:project4/pages/choose_location.dart';

import 'package:project4/pages/home.dart';
import 'package:project4/pages/loading.dart';

void main() {
  runApp(MaterialApp(
   // home:Home(),
   initialRoute: "/",
    routes: {
      '/':(context)=>Loading()
      ,'/home':(context) => Home()
      ,'/location':(context) => ChooseLoc()

    },
    ));
}
