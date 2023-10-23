
//-------------chatgpt
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterproj2/AdminSCreens/Scr6_AdminProfile/AdminProfile.dart';
import '../Scr2_LoginAdmin/adminLogin.dart';
import '../Scr5_EditDonar/EditDonar.dart';
import 'CustomDonarContainer.dart';

class ShowDonars extends StatefulWidget {
  const ShowDonars({super.key});

  @override
  State<ShowDonars> createState() => _ShowDonarsState();
}

class _ShowDonarsState extends State<ShowDonars> {
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
                    MaterialPageRoute(builder: (context) => AdminProfile()));
              },
              icon: Icon(Icons.person))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Donars').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("ERROR : ${snapshot.error}");
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    onTap: () {},
                    child: CustomDonarContainer(
                      onpressEdit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateDonar(
                              initialName: snapshot.data!.docs[index]['Name'],
                              initialLocation: snapshot.data!.docs[index]
                                  ['City'],
                              initialNumber: snapshot.data!.docs[index]
                                  ['Number'],
                              initialDate: snapshot.data!.docs[index]
                                  ['Last Donate'],
                              docId: snapshot.data!.docs[index].id,
                            ),
                          ),
                        ).then((updatedData) {
                          if (updatedData != null) {
                            // Handle updated data, e.g., update Firestore

                            print("Updated Data: $updatedData");
                            FirebaseFirestore.instance
                                .collection("Donars")
                                .doc(updatedData["docId"])
                                .set({
                              "Name": updatedData["Name"],
                              "City": updatedData["City"],
                              "Number": updatedData["Number"],
                              "Last Donate": updatedData["Last Donate"]
                            });
                          }
                        });
                      },
                      onpressDelete: () async {
                        await FirebaseFirestore.instance
                            .collection("Donars")
                            .doc(snapshot.data!.docs[index].id)
                            .delete();
                      },
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
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
