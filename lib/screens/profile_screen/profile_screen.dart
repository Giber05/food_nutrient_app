import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants.dart';
import '../widgets/custom_headbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const CustomHeadbar(
              title: "Profile",
              disableBackButton: true,
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 18.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image:
                      AssetImage(AssetConstant.image + "profile_picture.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Text(
                "Gilang Liberty",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Center(
              child: Text(
                "Mobile & Web Frontend Developer",
                style: TextStyle(
                  color: Color(0XFFA1A1A1),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 3.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
              child: ListTile(
                leading: SvgPicture.asset(
                  AssetConstant.icon + "profile_icon.svg",
                  height: 10.h,
                ),
                title: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: Color(0XFF707070),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0XFF909090),
                  size: 2.5.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
              child: ListTile(
                leading: SvgPicture.asset(
                  AssetConstant.icon + "star_icon.svg",
                  height: 10.h,
                ),
                title: Text(
                  "Renew Plans",
                  style: TextStyle(
                    color: Color(0XFF707070),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0XFF909090),
                  size: 2.5.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
              child: ListTile(
                leading: SvgPicture.asset(
                  AssetConstant.icon + "setting_icon.svg",
                  height: 10.h,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Color(0XFF707070),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0XFF909090),
                  size: 2.5.h,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
              child: Divider(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
              child: ListTile(
                leading: SvgPicture.asset(
                  AssetConstant.icon + "form_icon.svg",
                  height: 10.h,
                ),
                title: Text(
                  "Terms & Privacy Policy",
                  style: TextStyle(
                    color: Color(0XFF707070),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0XFF909090),
                  size: 2.5.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
              child: ListTile(
                leading: SvgPicture.asset(
                  AssetConstant.icon + "logout_icon.svg",
                  height: 10.h,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    color: Color(0XFF707070),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0XFF909090),
                  size: 2.5.h,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            )
          ],
        ),
      ),
    );
  }
}
