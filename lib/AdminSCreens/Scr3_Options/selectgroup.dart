import 'package:flutter/material.dart';

class SelectGroup extends StatefulWidget {
  final String Group;
  const SelectGroup({super.key, required this.Group});

  @override
  State<SelectGroup> createState() => _SelectGroupState();
}

class _SelectGroupState extends State<SelectGroup> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(
          height: 20,
          width: 34,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.red
                : Colors.white, // Change color based on isSelected
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.red),
          ),
          child: Center(
            child: Text(
              widget.Group,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.red, // Change text color based on isSelected
              ),
            ),
          ),
        ),
      ),
    );
  }
}
