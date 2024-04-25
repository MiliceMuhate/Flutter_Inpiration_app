// import 'package:flutter/foundation.dart';
// import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inspirationapp/presentation/pages/home.dart';
// import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: HomePage(),
    ));
} 

