import 'package:flutter/material.dart';
import 'package:food_catalog/models/meal.dart';
import 'package:food_catalog/screens/meal_details.dart';
import 'package:food_catalog/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.meals,
      this.title,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

//   @override
//   _MealsScreenState createState() => _MealsScreenState();
// }

  //class _MealsScreenState extends State<MealsScreen> {
  //  void _selectMeal(BuildContext context, Meal meal) {
  //    final updatedMeal = Navigator.of(context).push(
  //     MaterialPageRoute(
  //        builder: (ctx) => MealDetailsScreen(
  //         meal: meal,
  //          onToggleFavorite: (meal) {
  //           widget.onToggleFavorite(meal);
  //        },
  //      ),
  //    ),
  //  );
  // if (updatedMeal != null) {
  //  setState(() {
  // final index = widget.meals.indexWhere((m) => m.id == updatedMeal.id);
  // if (index != -1) {
  //   widget.meals[index] = updatedMeal;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Скольколько холодильник не проверяй...',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "А еда в нём сама не появится!",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            onSelectMeal: (
                //(context,
                meal) {
              selectMeal(context, meal);
            }
            //selectMeal,
            // onToggleFavorite: (meal) {
            // setState(() {
            //   onToggleFavorite(meal);
            // });
            // },
            ),
        //       ),
      );
    }

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Скольколько холодильник не проверяй...',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "А еда в нём сама не появится!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
//}
