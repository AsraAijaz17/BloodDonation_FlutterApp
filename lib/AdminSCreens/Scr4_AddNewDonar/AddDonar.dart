import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterproj2/AdminSCreens/Scr6_AdminProfile/AdminProfile.dart';

import '../Scr2_LoginAdmin/adminLogin.dart';

class AddDonar extends StatefulWidget {
  const AddDonar({super.key});

  @override
  State<AddDonar> createState() => _AddDonarState();
}

class _AddDonarState extends State<AddDonar> {
  TextEditingController _NameController = TextEditingController();
  TextEditingController _LocationController = TextEditingController();
  TextEditingController _NumberController = TextEditingController();
  TextEditingController _DateController = TextEditingController();

  addUser() {
    FirebaseFirestore.instance
        .collection('Donars')
        .add({
          "Name": _NameController.text,
          "City": _LocationController.text,
          "Number": _NumberController.text,
          "Last Donate": _DateController.text
        })
        .then((value) => print("Added Successfully"))
        .onError((error, stackTrace) => print(" thre is an error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("EDIT DONAR DETAIL"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminProfile()));
                },
                icon: Icon(Icons.person))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 70,
                color: const Color.fromARGB(255, 252, 252, 252),
                child: TextField(
                  controller: _NameController,
                  decoration: InputDecoration(
                      hintText: "Type Your Name", labelText: "Full Name"),
                ),
              ),
              //-------------------------
              Container(
                width: 300,
                height: 70,
                color: const Color.fromARGB(255, 252, 252, 252),
                child: TextField(
                  controller: _LocationController,
                  decoration:
                      InputDecoration(hintText: "Type Area", labelText: "Area"),
                ),
              ),
              //-----------------------------------
              Container(
                width: 300,
                height: 70,
                color: const Color.fromARGB(255, 252, 252, 252),
                child: TextField(
                  controller: _NumberController,
                  decoration: InputDecoration(
                      hintText: "Type Phone Number", labelText: "Phone"),
                ),
              ),
              //---------------------------
              Container(
                width: 300,
                height: 70,
                color: const Color.fromARGB(255, 252, 252, 252),
                child: TextField(
                  controller: _DateController,
                  decoration: InputDecoration(
                      hintText: "02/12/2022", labelText: "Last Donate Date"),
                ),
              ),
              //-------------------------
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  addUser();
                },
                child: Text("Add New Donor"),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 218, 45, 45), // Background color for "Add New Donor"
                  onPrimary: const Color.fromARGB(255, 250, 249, 249), // Text color for "Add New Donor"
                  fixedSize: Size(177, 48), // Set the width and height
                  side: BorderSide(color: Colors.red, width: 2), // Red border
                ),
              ),
            ],
          ),
        ));
  }
}
