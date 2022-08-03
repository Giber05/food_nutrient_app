import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/constants.dart';


class UnderDevelopScreen extends StatelessWidget {
  const UnderDevelopScreen({Key? key}) : super(key: key);
  static const routeName = "under-develop";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ListView(
          children: [
            SizedBox(height: 5.h),
            Center(
              child: Text(
                "Warning!",
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
                child: SvgPicture.asset(
                    AssetConstant.image + "under_develop.svg")),
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
                  "This feature is under development. You can't access this now!",
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: 30.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff91C788)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.5.w,
                    vertical: 1.h,
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
