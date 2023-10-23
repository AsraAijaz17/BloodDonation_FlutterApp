// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserProfile extends StatefulWidget {
//   const UserProfile({Key? key}) : super(key: key);

//   @override
//   State<UserProfile> createState() => _UserProfileState();
// }

// class _UserProfileState extends State<UserProfile> {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("User Profile"),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('Users')
//             .doc(_auth.currentUser!.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text("ERROR: ${snapshot.error}");
//           } else if (snapshot.hasData) {
//             final userData = snapshot.data!.data() as Map<String, dynamic>;
//             final userName = userData['Name'] as String? ?? 'N/A';
//             final userEmail = userData['email'] as String? ?? 'N/A';
//             final userContact = userData['Contact'] as String? ?? 'N/A';

//             return ListView(
//               children: [
//                 ListTile(
//                   title: Text("Name: $userName"),
//                 ),
//                 ListTile(
//                   title: Text("Email: $userEmail"),
//                 ),
//                 ListTile(
//                   title: Text("Contact: $userContact"),
//                 ),
//               ],
//             );
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                      left: 10,
                      child: Material(
                        elevation: 7,
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
                                    "USER PROFILE",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(_auth.currentUser!.uid)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text("ERROR : ${snapshot.error}");
                                  } else if (snapshot.hasData) {
                                    final adminData =
                                        snapshot.data!.data() as Map?;
                                    final name = adminData?['Name'] ?? 'N/A';
                                    final location =
                                        adminData?['email'] ?? 'N/A';
                                    final number =
                                        adminData?['Contact'] ?? 'N/A';

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(name),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                          thickness: 2,
                                          indent: 30,
                                          endIndent: 30,
                                        ),
                                        SizedBox(height: 40),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(location),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                          thickness: 2,
                                          indent: 30,
                                          endIndent: 30,
                                        ),
                                        SizedBox(height: 40),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(number),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                          thickness: 2,
                                          indent: 30,
                                          endIndent: 30,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 15,
                        left: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your logout logic here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            fixedSize: Size(254, 48),
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
