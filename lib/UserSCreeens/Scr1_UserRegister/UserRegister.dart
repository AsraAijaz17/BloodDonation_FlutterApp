import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproj2/UserSCreeens/Scr2_UserLogin/UserLogin.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController ContactController = TextEditingController();

  registerUser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
      await _firestore.collection("Users").doc(credential.user!.uid).set({
        "email": emailController.text,
        "role": "User",
        "Name": NameController.text,
        "Contact": ContactController.text
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserLogin()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
              bottom: 80,
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
                      padding: const EdgeInsets.all(28.0),
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      width: 280,
                      height: 60,
                      child: TextField(
                        controller: NameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          // Label text
                          hintText: 'Type your Name', // Hint text
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 179, 178,
                                    178)), // The color of the line
                          ),

                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ),

                    //--------------
                    Container(
                      width: 280,
                      height: 60,
                      child: TextField(
                        controller: ContactController,
                        decoration: InputDecoration(
                          labelText: 'Contact',
                          labelStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          // Label text
                          hintText: 'Type your Contact Number', // Hint text
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 179, 178,
                                    178)), // The color of the line
                          ),

                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ),

                    //------------
                    Container(
                      width: 280,
                      height: 60,
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
                      height: 60,
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
              bottom: 50,
              left: 80,
              child: ElevatedButton(
                onPressed: () {
                  registerUser();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Set the background color to red
                  fixedSize: Size(254, 48), // Set the width and height
                ),
                child: Text("Register"),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 110,
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserLogin()));
                  },
                  child: Text("Already Have an Account? Login!")),
            )
          ],
        ),
      ),
    );
  }
}



// Column(
//         children: [
//           Container(
//             color: Color(0xFFEB3738),
//             height: 200,
//           ),
//           //---------------------
//           SizedBox(
//             height: 10,
//           ),

//           //-----------------------------
//           Container(
//             color: Color.fromARGB(255, 235, 231, 231),
//             height: 300,
//             child: Column(
//               children: [
//                 Text("Register"),
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email', // Label text
//                     hintText: 'Type your Email', // Hint text

//                     contentPadding: EdgeInsets.all(10.0),
//                   ),
//                 ),
//                 TextField(
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password', // Label text
//                     hintText: 'Type your password', // Hint text

//                     contentPadding: EdgeInsets.all(10.0),
//                   ),
//                 ),
//               ],
//             ),
          // ),
          //-------------------------------
      //     ElevatedButton(
      //       onPressed: () {
      //         registerUser();
      //       },
      //       style: ElevatedButton.styleFrom(
      //         primary: Colors.red, // Set the background color to red
      //         fixedSize: Size(254, 48), // Set the width and height
      //       ),
      //       child: Text("Register"),
      //     )
      //   ],
      // ),
