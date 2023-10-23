//-------------chatgpt
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproj2/UserSCreeens/Scr5_Userprofile/UserProfile.dart';
import 'package:flutterproj2/UserSCreeens/scr4_ShowAllDonars/donardetail.dart';
import 'package:flutterproj2/UserSCreeens/scr4_ShowAllDonars/user_customDonarCont.dart';

class UserShowDonars extends StatefulWidget {
  const UserShowDonars({super.key});

  @override
  State<UserShowDonars> createState() => _UserShowDonarsState();
}

class _UserShowDonarsState extends State<UserShowDonars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("All Donars"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
              icon: Icon(Icons.person))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Donars').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("ERROR : ${snapshot.error}");
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonarDetail(
                                  name: "${snapshot.data!.docs[index]['Name']}",
                                  location:
                                      "${snapshot.data!.docs[index]['City']}",
                                  contact:
                                      "${snapshot.data!.docs[index]['Number']}",
                                  date:
                                      "${snapshot.data!.docs[index]['Last Donate']}")));
                    },
                    child: UserCustomDonarCont(
                      Name: "${snapshot.data!.docs[index]['Name']}",
                      City: "${snapshot.data!.docs[index]['City']}",
                      Number: "${snapshot.data!.docs[index]['Number']}",
                      Date: "${snapshot.data!.docs[index]['Last Donate']}",
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
