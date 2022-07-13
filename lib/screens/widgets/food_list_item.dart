import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/food_model.dart';

class FoodListItem extends StatelessWidget {
  final FoodModel food;
  const FoodListItem({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      width: 90.w,
      decoration: BoxDecoration(
        color: Color(0xFFEFF7EE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Center(
                child: Image.network(
                  food.image,
                  fit: BoxFit.cover,
                  height: 10.h,
                
                ),
              ),
            ),
            flex: 5,
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    food.kcal.toString() + " Kcal",
                    style: TextStyle(
                        color: Color(0xFF6CB663),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Signika"),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    food.foodName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF2E2E2E),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    food.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Color(0xFF767676),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
