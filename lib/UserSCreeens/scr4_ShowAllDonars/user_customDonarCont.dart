import 'package:flutter/material.dart';
import 'package:flutterproj2/AdminSCreens/Scr3_Options/selectgroup.dart';

class UserCustomDonarCont extends StatefulWidget {
  final String Name;
  final String City;
  final String Number;
  final String Date;
  final void Function()? onpressEdit;
  final void Function()? onpressDelete;
  final void Function()? onpressGOTODONARDETAILPAGE;

  const UserCustomDonarCont({
    super.key,
    required this.Name,
    required this.City,
    required this.Number,
    required this.Date,
    this.onpressEdit,
    this.onpressDelete, this.onpressGOTODONARDETAILPAGE,
  });

  @override
  State<UserCustomDonarCont> createState() => _UserCustomDonarContState();
}

class _UserCustomDonarContState extends State<UserCustomDonarCont> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpressGOTODONARDETAILPAGE ,
      child: SizedBox(
        height: 160, // Set the height of the Card
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: Colors.red), // Rounded borders
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0), // Add padding for spacing
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
    
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Align text to the left
              children: [
                Row(
                  children: [
                    Text(
                      widget.Name.toString(),
                    ),
                    Spacer(),
                    //-----------
    
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Container(
                        height: 20,
                        width: 34,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 222, 50, 50),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                          child: Text(
                            "A+",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 234, 228, 227)),
                          ),
                        ),
                      ),
                    ),
    
                    //------------
                  ],
                ),
                Text(widget.City.toString()),
                SizedBox(
                  height: 10,
                ),
                Text(widget.Number.toString()),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.Date.toString()),
                    
                  
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
