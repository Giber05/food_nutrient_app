import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../dummy_data/food_list.dart';
import '../../../data/models/food_model.dart';
import '../widgets/custom_headbar.dart';
import '../widgets/food_card_item.dart';
import '../widgets/food_list_item.dart';

class FoodsByCategoryScreen extends StatelessWidget {
  static const routeName = "/foodsByCategory";
  final categoryId;
  const FoodsByCategoryScreen({Key? key, required this.categoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomHeadbar(
            title: "Food List",
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 90.w,
            height: 7.h,
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color(0xFFFF9385),
            ),
            child: Center(
              child: Text(
                _getCategoryNameFromId(categoryId),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth < 600) {
                  return ListView.builder(
                    itemCount: foodList.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final FoodModel food = foodList[index];
                      if (food.categoryId == categoryId)
                        return Padding(
                          padding: EdgeInsets.all(3.w),
                          child: FoodListItem(food: food),
                        );
                      return SizedBox();
                    },
                  );
                } else if (constraints.maxWidth < 900) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: foodList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final FoodModel food = foodList[index];
                      if (food.categoryId == categoryId)
                        return FoodCardItem(
                          food: food,
                        );
                      return SizedBox();
                    },
                  );
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: foodList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final FoodModel food = foodList[index];
                      if (food.categoryId == categoryId)
                        return FoodCardItem(food: food);
                      return SizedBox();
                    },
                  );
                }
              },
            ),
          ),
        ],
      )),
    );
  }

  String _getCategoryNameFromId(int id) {
    switch (id) {
      case 1:
        return "Vegetable";
      case 2:
        return "Fruit";
      case 3:
        return "Snack";
      case 4:
        return "Meat";
      case 5:
        return "Bread";
      case 6:
        return "Fat";

      default:
        return "Uncategorized";
    }
  }
}
