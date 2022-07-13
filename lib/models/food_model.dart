class FoodModel {
  FoodModel({
    required this.id,
    required this.foodName,
    required this.image,
    required this.kcal,
    required this.categoryId,
    required this.description,
  });

  int id;
  String foodName;
  String image;
  int kcal;
  int categoryId;
  String description;
}
