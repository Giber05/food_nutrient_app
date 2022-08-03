import 'package:FoodNutrient/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';


class SearchNotFound extends StatelessWidget {
  const SearchNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetConstant.icon + "search_not_found.svg",
          width: 35.w,
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          "No Results Found",
          style: TextStyle(
            color: Color(0XFF696969),
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 15.w),
          child: Text(
            "Try searching for a different keywork or tweek your search a little",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0XFFA9A9A9),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    ));
  }
}
