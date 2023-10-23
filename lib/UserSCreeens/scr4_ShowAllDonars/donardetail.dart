import 'package:flutter/material.dart';

class DonarDetail extends StatefulWidget {
  final String name;
  final String location;
  final String contact;
  final String date;

  const DonarDetail(
      {super.key,
      required this.name,
      required this.location,
      required this.contact,
      required this.date});

  @override
  State<DonarDetail> createState() => _DonarDetailState();
}

class _DonarDetailState extends State<DonarDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("DONAR DETAILS"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              widget.name,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              width: 350,
              child: Divider(
                color: Colors.black, // Set the color of the divider to black
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //-----------------------------------
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              widget.location,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              width: 350,
              child: Divider(
                color: Colors.black, // Set the color of the divider to black
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //--------------------------
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              widget.contact,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              width: 350,
              child: Divider(
                color: Colors.black, // Set the color of the divider to black
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //---------------------------------
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              widget.date,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              width: 350,
              child: Divider(
                color: Colors.black, // Set the color of the divider to black
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text(
                  "Blood Group",
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Container(
                    height: 20,
                    width: 34,
                    decoration: BoxDecoration(
                      color: Colors.red, // Change color based on isSelected
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.red),
                    ),
                    child: Center(
                      child: Text(
                        "A+",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              height: 139,
              width: 310,
              child: Image.asset(
                "assets/images/r.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Container(
              height: 58,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Call",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
