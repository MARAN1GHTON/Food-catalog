import 'package:flutter/material.dart';
import 'package:food_catalog/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

//   @override
//   _MealDetailsScreenState createState() => _MealDetailsScreenState();
// }

// class _MealDetailsScreenState extends State<MealDetailsScreen> {
//   late bool isFavorite;
  // void _toggleFavorite() {
  //   setState(() {
  //     widget.onToggleFavorite(widget.meal);
  //   });
  //}

  // @override
  // void initState() {
  //   super.initState();
  //   isFavorite = widget.meal.isFavorite;
  // }

  // void _toggleFavorite() {
  //   setState(() {
  //     isFavorite = !isFavorite;
  //     widget.onToggleFavorite(widget.meal);
  //   });
  // }

  // void _onPopInvoked(bool value) {
  //   Navigator.of(context).pop(widget.meal);
  // }

  // @override
  // void dispose() {
  //   // Возвращаем обновленное состояние блюда при закрытии экрана
  //   Navigator.of(context).pop(widget.meal);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return
        //PopScope(
        //onPopInvoked: _onPopInvoked,
        //child:
        Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            }
            // _toggleFavorite
            // setState(() {
            //   widget.meal.isFavorite = !widget.meal.isFavorite;
            // });
            ,
            icon: const Icon(
                //meal.isFavorite ?
                Icons.star
                // : Icons.star_border,
                //color: meal.isFavorite ? Colors.yellow : null,
                ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
              'Ингридиенты',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    //fontWeight: FontWeight.bold
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Этапы',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ),
      ),
      //),
    );
  }
}
