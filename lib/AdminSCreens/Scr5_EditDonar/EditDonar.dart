

//-----------------------------
//---chatgpt
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Scr6_AdminProfile/AdminProfile.dart';

class UpdateDonar extends StatefulWidget {
  final String initialName;
  final String initialLocation;
  final String initialNumber;
  final String initialDate;
  final String docId;
  const UpdateDonar({
    super.key,
    required this.initialName,
    required this.initialLocation,
    required this.initialNumber,
    required this.initialDate, required this.docId,
  });

  @override
  State<UpdateDonar> createState() => _UpdateDonarState();
}

class _UpdateDonarState extends State<UpdateDonar> {
  TextEditingController  _NameController = TextEditingController();
  TextEditingController _LocationController = TextEditingController();
  TextEditingController _NumberController = TextEditingController();
  TextEditingController _DateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _NameController.text = widget.initialName;
    _LocationController.text = widget.initialLocation;
    _NumberController.text = widget.initialNumber;
    _DateController.text = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Update Donar Detail"),
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
                  hintText: "Type Your Name",
                  labelText: "Full Name",labelStyle: TextStyle(fontSize: 20,color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 300,
              height: 70,
              color: const Color.fromARGB(255, 252, 252, 252),
              child: TextField(
                controller: _LocationController,
                decoration: InputDecoration(
                  hintText: "Type Area",
                  labelText: "Area",labelStyle: TextStyle(fontSize: 20,color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 300,
              height: 70,
              color: const Color.fromARGB(255, 252, 252, 252),
              child: TextField(
                controller: _NumberController,
                decoration: InputDecoration(
                  hintText: "Type Phone Number",
                  labelText: "Phone",labelStyle: TextStyle(fontSize: 20,color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 300,
              height: 70,
              color: const Color.fromARGB(255, 252, 252, 252),
              child: TextField(
                controller: _DateController,
                decoration: InputDecoration(
                  
                  hintText: "02/12/2022",
                  labelText: "Last Donate Date",labelStyle: TextStyle(fontSize: 20,color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Pass updated data back to the previous screen
                Navigator.pop(context, {
                  'Name': _NameController.text,
                  'City': _LocationController.text,
                  'Number': _NumberController.text,
                  'Last Donate': _DateController.text,
                  'docId': widget
                      .docId, // Include the document ID for Firestore update
                });
              },
              child: Text("Update Donor",style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 245, 245, 245)),),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 213, 50, 50),
                onPrimary: const Color.fromARGB(255, 249, 248, 248),
                fixedSize: Size(177, 48),
                side: BorderSide(color: Colors.red, width: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
