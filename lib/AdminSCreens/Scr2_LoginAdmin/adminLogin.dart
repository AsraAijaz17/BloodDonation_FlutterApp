// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../Scr3_Options/Options.dart';

// class AdminLogin extends StatefulWidget {
//   const AdminLogin({super.key});

//   @override
//   State<AdminLogin> createState() => _AdminLoginState();
// }

// class _AdminLoginState extends State<AdminLogin> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   loginUser() async {
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);

//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => Options()));

//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//               height: 550,
//               child: Stack(
//                 children: [
//                   Container(
//                     color: Color(0xFFEB3738),
//                     height: 300,
//                   ),
//                   Positioned(
//                     bottom: 30,
//                     left: 20,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 246, 242, 242),
//                           borderRadius: BorderRadius.circular(20)),
//                       height: 365,
//                       width: 330,
//                       child: Column(
//                         children: [
//                           Text("Login"),
//                           TextField(
//                             controller: emailController,
//                             decoration: InputDecoration(
//                               labelText: 'Email', // Label text
//                               hintText: 'Type your Email', // Hint text

//                               contentPadding: EdgeInsets.all(10.0),
//                             ),
//                           ),
//                           TextField(
//                             controller: passwordController,
//                             decoration: InputDecoration(
//                               labelText: 'Password', // Label text
//                               hintText: 'Type your password', // Hint text

//                               contentPadding: EdgeInsets.all(10.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 5,
//                     left: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         loginUser();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.red, // Set the background color to red
//                         fixedSize: Size(254, 48), // Set the width and height
//                       ),
//                       child: Text("Login In"),
//                     ),
//                   ),
//                 ],
//               )),
//           InkWell(
//               onTap: () {
//                 // Navigator.pushReplacement(context,
//                 //     MaterialPageRoute(builder: (context) => ScreenTwo()));
//               },
//               child: Text("Dont Have Account? Register yourself"))
//           //---------------------
//         ],
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproj2/AdminSCreens/Scr2_LoginAdmin/adminLogin.dart';
import 'package:flutterproj2/UserSCreeens/Scr2_UserLogin/UserLogin.dart';

import '../../AdminSCreens/Scr3_Options/Options.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginUser() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Options()));
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
                  SizedBox(
                    height: 30,
                  ),
                  Icon(
                    Icons.water_drop,
                    color: Colors.white,
                    size: 70,
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
              left: 20,
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
                        "LOGIN AS ADMIN",
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
                                  builder: (context) => UserLogin()));
                        },
                        child: Text(
                          "Login As User",
                          style: TextStyle(fontSize: 10),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 280,
                      height: 50,
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
                      height: 30,
                    ),
                    Container(
                      width: 280,
                      height: 50,
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
              left: 60,
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
            // Positioned(
            //   bottom: 10,
            //   left: 70,
            //   child: InkWell(
            //       onTap: () {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => UserLogin()));
            //       },
            //       child: Text("Don't Have an Account? Register!")),
            // ),
          ],
        ),
      ),
    );
  }
}
