import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/food_model.dart';

class FoodCardItem extends StatelessWidget {
  final FoodModel food;
  const FoodCardItem({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(2.h),
      height: 27.h,
      width: 25.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(
          0XFFF4F4F4,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0.5.h),
            child: Image.network(
              food.image,
              fit: BoxFit.cover,
              height: width <= 768
                  ? 18.h
                  : width < 900
                      ? 19.h
                      : width < 1000
                          ? 10.h
                          : 20.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.5.w,
              right: 1.5.w,
              top: 0.5.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    food.foodName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width <= 768
                          ? 9.sp
                          : width < 900
                              ? 10.sp
                              : 5.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    food.kcal.toString() + "Kcal",
                    style: TextStyle(
                      color: Color(0XFF91C788),
                      fontSize: width <= 768
                          ? 7.sp
                          : width < 900
                              ? 8.sp
                              : 4.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.5.w,
              right: 1.5.w,
              top: 0.5.h,
              bottom: 2.h,
            ),
            child: Expanded(
              child: Text(
                food.description,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: width > 768 ? 2 : 3,
                style: TextStyle(
                  color: Color(0XFF767676),
                  fontSize: width <= 768
                      ? 7.sp
                      : width < 900
                          ? 8.sp
                          : 4.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
