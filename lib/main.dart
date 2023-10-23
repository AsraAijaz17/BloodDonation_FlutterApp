import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterproj2/AdminSCreens/Scr1_Splash/Splashscreen.dart';
import 'package:flutterproj2/AdminSCreens/Scr3_Options/Options.dart';
import 'package:flutterproj2/AdminSCreens/Scr3_Options/selectgroup.dart';
import 'package:flutterproj2/UserSCreeens/Scr1_UserRegister/UserRegister.dart';
import 'package:flutterproj2/UserSCreeens/Scr2_UserLogin/UserLogin.dart';

import 'package:flutterproj2/firebase_options.dart';
import 'package:flutterproj2/rough.dart';

void main() async {
  // try {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // } catch (e) {
  //   print('Firebase initialization error: $e');
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
