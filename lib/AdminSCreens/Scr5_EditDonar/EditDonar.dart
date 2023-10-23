

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
              height: 50,
              color: const Color.fromARGB(255, 252, 252, 252),
              child: TextField(
                controller: _NameController,
                decoration: InputDecoration(
                  hintText: "Type Your Name",
                  labelText: "Full Name",
                ),
              ),
            ),
            Container(
              width: 300,
              height: 50,
              color: const Color.fromARGB(255, 252, 252, 252),
              child: TextField(
                controller: _LocationController,
                decoration: InputDecoration(
                  hintText: "Type Area",
                  labelText: "Area",
                ),
              ),
            ),
            Container(
              width: 300,
              height: 50,
              color: const Color.fromARGB(255, 252, 252, 252),
              child: TextField(
                controller: _NumberController,
                decoration: InputDecoration(
                  hintText: "Type Phone Number",
                  labelText: "Phone",
                ),
              ),
            ),
            Container(
              width: 300,
              height: 50,
              color: const Color.fromARGB(255, 252, 252, 252),
              child: TextField(
                controller: _DateController,
                decoration: InputDecoration(
                  hintText: "02/12/2022",
                  labelText: "Last Donate Date",
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
              child: Text("Update Donor"),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.red,
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
