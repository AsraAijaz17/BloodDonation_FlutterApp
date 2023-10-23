import 'package:flutter/material.dart';
import 'package:flutterproj2/AdminSCreens/Scr2_LoginAdmin/adminLogin.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Container(
                height: 400,
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      child: Material(
                        elevation: 37,
                        child: Container(
                          height: 365,
                          width: 340,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "MANAGER PROFILE",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text("JohnDoe"),
                              ),
                              Divider(
                                color: Colors.grey, // Set the color to grey
                                thickness: 2, // Set the thickness of the line
                                indent:
                                    30, // Set the starting point of the line from the left
                                endIndent:
                                    30, // Set the ending point of the line from the right
                              ),

                              SizedBox(
                                height: 40,
                              ),
                              //-----------------------
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text("Johar Town Lahore"),
                              ),
                              Divider(
                                color: Colors.grey, // Set the color to grey
                                thickness: 2, // Set the thickness of the line
                                indent:
                                    30, // Set the starting point of the line from the left
                                endIndent:
                                    30, // Set the ending point of the line from the right
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              //-----------------------
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text("+923086785745"),
                              ),
                              Divider(
                                color: Colors.grey, // Set the color to grey
                                thickness: 2, // Set the thickness of the line
                                indent:
                                    30, // Set the starting point of the line from the left
                                endIndent:
                                    30, // Set the ending point of the line from the right
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 15,
                        left: 80,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminLogin()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // Background color
                            onPrimary: Colors.white, // Text color
                            fixedSize: Size(254, 48), // Width and height
                          ),
                          child: Text("Logout"),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
