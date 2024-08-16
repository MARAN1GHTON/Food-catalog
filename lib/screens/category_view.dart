import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:food_catalog/data/dummy_data.dart';
import 'package:food_catalog/models/category_model.dart';
import 'package:food_catalog/models/meal.dart';
import 'package:food_catalog/screens/meals.dart';
// import 'package:food_catalog/models/category_model.dart';
import 'package:food_catalog/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availebleMeals,
  });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availebleMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filtereMeals = availebleMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          meals: filtereMeals,
          title: category.title,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
