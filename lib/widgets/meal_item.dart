import 'package:flutter/material.dart';
import 'package:food_catalog/models/meal.dart';

//import 'package:food_catalog/screens/meal_details.dart';
import 'package:food_catalog/widgets/meal_itam_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
    //required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(
      // BuildContext context,
      Meal meal) onSelectMeal;
  // final void Function(Meal meal) onToggleFavorite;

  // @override
  // _MealItemState createState() => _MealItemState();

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

// class _MealItemState extends State<MealItem> {
//   void _toggleFavorite() {
//     setState(() {
//       widget.onToggleFavorite(widget.meal);
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
          // print('MealItem tapped');
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (ctx) => MealDetailScreen(
          //       meal: widget.meal,
          //       onToggleFavorite: (Meal meal) {
          //         _toggleFavorite;
        },
        //     ),
        // ),
        // );
        // },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: const Color.fromARGB(143, 0, 0, 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                              icon: Icons.category_outlined,
                              label: complexityText),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                              icon: Icons.attach_money,
                              label: affordabilityText),
                          // IconButton(
                          //   icon: const Icon(
                          // widget.meal.isFavorite
                          //?
                          //  Icons.star
                          //: Icons.star_border,
                          //color: widget.meal.isFavorite
                          //    ? Colors.yellow
                          //   : Colors.white,
                          //    ),
                          // onPressed: _toggleFavorite,
                          //),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
