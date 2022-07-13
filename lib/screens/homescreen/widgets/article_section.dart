import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../additional_screen/under_develop_screen.dart';

class ArticleSection extends StatelessWidget {
  const ArticleSection({
    Key? key,
    required this.title,
    required this.icon,
    this.navigateToRoute,
  }) : super(key: key);
  final String? navigateToRoute;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: 3.h,
        left: 6.w,
        right: 6.w,
      ),
      child: Container(
        width: 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Color(0xFFFFF8EB),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 3.h, left: 6.w, bottom: 4),
                    child: Text(
                      "ARTICLE",
                      style: TextStyle(
                        color: Color(0xFFFF806E),
                        fontSize: 8.sp,
                        letterSpacing: 2.4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 6.w,
                      bottom: 10,
                    ),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        color: Color(0xFF330600),
                        fontSize: 13.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, bottom: 3.h),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFFF8473)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UnderDevelopScreen()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Read More",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.sp,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_rounded,
                            color: Colors.white,
                            size: width > 768 ? 50 : 5.w,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(child: icon),
            ),
          ],
        ),
      ),
    );
  }
}
