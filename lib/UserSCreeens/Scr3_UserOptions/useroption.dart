import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterproj2/AdminSCreens/Scr2_LoginAdmin/adminLogin.dart';
import 'package:flutterproj2/AdminSCreens/Scr3_Options/selectgroup.dart';
import 'package:flutterproj2/AdminSCreens/Scr4_AddNewDonar/AddDonar.dart';
import 'package:flutterproj2/AdminSCreens/Scr6_AdminProfile/AdminProfile.dart';
import 'package:flutterproj2/UserSCreeens/Scr5_Userprofile/UserProfile.dart';
import 'package:flutterproj2/UserSCreeens/scr4_ShowAllDonars/user_showdonars.dart';

import '../../AdminSCreens/Scr4_ShowAllDonars/ShowAllDonars.dart';

class UserOptions extends StatefulWidget {
  const UserOptions({super.key});

  @override
  State<UserOptions> createState() => _UserOptionsState();
}

class _UserOptionsState extends State<UserOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEB3738),
        title: Text("JOHAR TOWN LAHORE"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
              icon: Icon(Icons.person))
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 600,
              width: double.infinity,
              child: Image.asset(
                "assets/images/r.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text("Blood Groups"),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SelectGroup(Group: "O+"),
                SelectGroup(Group: "B+"),
                SelectGroup(Group: "AB+"),
                SelectGroup(Group: "A+"),
                SelectGroup(Group: "A-"),
                SelectGroup(Group: "B-"),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SelectGroup(Group: "AB-"),
                SelectGroup(Group: "O-"),
                SelectGroup(Group: "ALL"),
              ],
            ),
            // Spacer(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserShowDonars()));
                  },
                  child: Text("Show All"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Background color for "Show All"
                    onPrimary: Colors.white, // Text color for "Show All"
                    fixedSize: Size(177, 48), // Set the width and height
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddDonar()));
                  },
                  child: Text("Add New Donor"),
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.white, // Background color for "Add New Donor"
                    onPrimary: Colors.red, // Text color for "Add New Donor"
                    fixedSize: Size(177, 48), // Set the width and height
                    side: BorderSide(color: Colors.red, width: 2), // Red border
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
