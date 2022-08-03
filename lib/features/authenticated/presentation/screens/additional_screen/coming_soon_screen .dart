import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/constants.dart';


class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);
  static const routeName = "under-develop";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5.h),
          Center(
            child: Text(
              "Coming Soon!",
              style: TextStyle(
                color: Color(0xff91C788),
                fontSize: 25,
                fontFamily: "Signika",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Center(
              child:
                  SvgPicture.asset(AssetConstant.image + "under_develop.svg")),
          SizedBox(height: 5.h),
          Center(
            child: Text(
              "Whoops!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Center(
              child: Text(
                "This feature will be available soon!",
                style: TextStyle(
                  color: Color(0xff7B7B7B),
                  fontSize: 18,
                  fontFamily: "Signika",
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      )),
    );
  }
}
