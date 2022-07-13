import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Greeting extends StatelessWidget {
  final String name;
  const Greeting({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hello $name",
            style: TextStyle(
              color: Color(0xff91C788),
              fontSize: 16.sp,
              fontFamily: "Signika",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Find and track healthy food ",
            style: TextStyle(
              color: Color(0xff7B7B7B),
              fontSize: 12.sp,
              fontFamily: "Signika",
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
