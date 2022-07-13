import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomHeadbar extends StatelessWidget {
  final String title;
  final bool? disableBackButton;
  const CustomHeadbar(
      {Key? key, required this.title, this.disableBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: 8.5.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFF91C788),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(36))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (disableBackButton == false)
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          )),
                  ],
                ),
                Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width > 900 ? 10.sp : 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
