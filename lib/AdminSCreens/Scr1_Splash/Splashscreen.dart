import 'package:flutter/material.dart';

import '../Scr2_LoginAdmin/adminLogin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminLogin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEB3738),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.water_drop,
              color: Colors.white,
              size: 180,
            ),
            Text(
              "ZINDAGI",
              style: TextStyle(color: Colors.white, fontSize: 50),
            )
          ],
        ),
      ),
    );
  }
}
