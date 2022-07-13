import 'package:FoodNutrient/screens/homescreen/widgets/article_section.dart';
import 'package:FoodNutrient/screens/homescreen/widgets/category_item.dart';
import 'package:FoodNutrient/screens/homescreen/widgets/greeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import '../../dummy_data/food_category_list.dart';
import '../../models/food_category.dart';
import '../additional_screen/under_develop_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 5.h),
            const Greeting(
              name: "Gilang Liberty",
            ),
            ArticleSection(
              icon: SvgPicture.asset(
                "assets/icons/burger_icon.svg",
                width: 25.w,
              ),
              title: "The pros and cons of fast food.",
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: SvgPicture.asset(
                "assets/icons/index_image.svg",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              child: Container(
                height: 15.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFFC6C4DE),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 6.w,
                          bottom: 1.2.w,
                          right: 2.w,
                        ),
                        child: Text(
                          "Track Your Weekly Progress",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(right: 6.w),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UnderDevelopScreen()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "View Now",
                                  style: TextStyle(
                                    color: Color(0xFF9e9bc7),
                                    fontSize: 9.sp,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: Color(0xFF9e9bc7),
                                  size: width > 768 ? 50 : 5.w,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 1.h,
                right: 4.w,
                left: 4.w,
              ),
              child: Text(
                "Choose Your Favorites",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 22.h,
              width: 21.h,
              padding:
                  EdgeInsets.only(top: 1.h, right: 4.w, left: 4.w, bottom: 3.h),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: foodCategoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  final FoodCategory foodCategory = foodCategoryList[index];
                  return Center(
                    child: CategoryItem(
                      bgColor: Color(foodCategory.bgColor),
                      title: foodCategory.name,
                      iconPath: foodCategory.image,
                      categoryId: foodCategory.id,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
