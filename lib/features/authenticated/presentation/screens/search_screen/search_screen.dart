import 'package:FoodNutrient/dummy_data/food_list.dart';
import 'package:FoodNutrient/features/authenticated/presentation/screens/search_screen/widgets/search_not_found.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../data/models/food_model.dart';
import '../widgets/food_card_item.dart';
import '../widgets/food_list_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<FoodModel> _foods = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
              child: TextField(
                onChanged: (value) => _searchFood(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFF4F4F4),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Color(0XFFF4F4F4)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0XFF999999)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Search recipes, articles, people...",
                  hintStyle: TextStyle(color: Color(0XFF999999)),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Color(0XFF999999),
                  ),
                ),
              ),
            ),
            _foods.isNotEmpty
                ? LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      if (constraints.maxWidth < 600) {
                        return ListView.builder(
                          itemCount: _foods.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            final FoodModel food = _foods[index];
                            return Padding(
                              padding: EdgeInsets.all(3.w),
                              child: FoodListItem(food: food),
                            );
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
                          itemCount: _foods.length,
                          itemBuilder: (BuildContext context, int index) {
                            final FoodModel food = _foods[index];

                            return FoodCardItem(
                              food: food,
                            );
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
                          itemCount: _foods.length,
                          itemBuilder: (BuildContext context, int index) {
                            final FoodModel food = _foods[index];

                            return FoodCardItem(food: food);
                          },
                        );
                      }
                    },
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: SearchNotFound(),
                  ),
          ],
        ),
      ),
    );
  }

  void _searchFood(String enteredKeyword) {
    List<FoodModel> results = [];
    if (enteredKeyword.isNotEmpty) {
      results = foodList
          .where((food) => food.foodName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foods = results;
    });
  }
}
