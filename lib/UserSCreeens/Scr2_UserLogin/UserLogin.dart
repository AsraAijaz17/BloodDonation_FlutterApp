import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproj2/AdminSCreens/Scr2_LoginAdmin/adminLogin.dart';
import 'package:flutterproj2/UserSCreeens/Scr1_UserRegister/UserRegister.dart';

import '../../AdminSCreens/Scr3_Options/Options.dart';
import '../Scr3_UserOptions/useroption.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginUser() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserOptions()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 600,
        child: Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Color(0xFFEB3738),
              child: Column(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Icon(
                      Icons.water_drop,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                  Text(
                    "ZINDAGI",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 60,
              left: 50,
              child: Material(
                elevation: 28,
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20)),
                  height: 365,
                  width: 330,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Text(
                        "LOGIN AS USER",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminLogin()));
                        },
                        child: Text(
                          "Login As Admin",
                          style: TextStyle(fontSize: 10),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 280,
                      height: 70,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500), // Label text
                          hintText: 'Type your Email', // Hint text
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 157, 157,
                                    157)), // The color of the line
                          ),

                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 280,
                      height: 70,
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          // Label text
                          hintText: 'Type your password', // Hint text
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 179, 178,
                                    178)), // The color of the line
                          ),

                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Positioned(
              bottom: 45,
              left: 90,
              child: ElevatedButton(
                onPressed: () {
                  loginUser();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Set the background color to red
                  fixedSize: Size(254, 48), // Set the width and height
                ),
                child: Text("Login"),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 120,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserRegister()));
                  },
                  child: Text("Don't Have an Account? Register!")),
            ),
          ],
        ),
      ),
    );
  }
}
