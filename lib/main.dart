import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';

import 'app.dart';
import 'firebase_options.dart';

/// -------Entry Point for the Flutter Application ---------
Future<void> main() async {
  //  TODO : Add Widget Bindings
  // TODO : Init Local Storage
  // TODO : Await Native Splash
  // TODO : Initialize Firebase
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepository()),);
  // TODO : Initialize Authentication


  runApp(const Main_app());
}
