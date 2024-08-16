import 'package:flutter/material.dart';
import 'package:food_catalog/screens/tabs.dart';
import 'package:food_catalog/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  // Future<bool?> _onPopInvoked(bool didPop) async {
  //   if (didPop) {
  void _saveFilters() {
    Navigator.of(context).pop({
      Filter.glutenFree: _glutenFreeFilterSet,
      Filter.lactoseFree: _lactoseFreeFilterSet,
      Filter.vegetarian: _vegetarianFilterSet,
      Filter.vegan: _veganFilterSet,
    });
    //   return true;
    // }
    // return false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        if (didPop) {
          _saveFilters();
        }
        //return true;
      },
      canPop: true,
      //_onPopInvoked,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ваши фильтры'),
        ),
        drawer: MainDrawer(onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TabsScreen(),
              ),
            );
          }
        }),
        body:
            // PopScope(
            //   canPop: true,
            //   onPopInvoked: (bool didPop) async {
            //     if (didPop) {
            //     Navigator.of(context).pop({
            //       Filter.glutenFree: _glutenFreeFilterSet,
            //       Filter.lactoseFree: _lactoseFreeFilterSet,
            //       Filter.vegetarian: _veganFilterSet,
            //       Filter.vegan: _veganFilterSet,
            //     });
            //    return;
            //   }
            //   return;
            //   }
            // child:
            Column(
          children: [
            //   PopScope(
            //     onPopInvoked: (bool didPop) async {
            //       if (didPop) {
            //         Navigator.of(context).pop({
            //           Filter.glutenFree: _glutenFreeFilterSet,
            //           Filter.lactoseFree: _lactoseFreeFilterSet,
            //           Filter.vegetarian: _veganFilterSet,
            //           Filter.vegan: _veganFilterSet,
            //         });
            //         return;
            //       }
            //       return;
            //     },
            //     canPop: false,
            //   ),
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _glutenFreeFilterSet = newValue;
                });
              },
              title: Text(
                'Не содержит глютена',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
              ),
              subtitle: Text(
                'Показать только блюда без глютена',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _lactoseFreeFilterSet = newValue;
                });
              },
              title: Text(
                'Не содержит лактозу',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
              ),
              subtitle: Text(
                'Показать только блюда без лактозы',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _vegetarianFilterSet = newValue;
                });
              },
              title: Text(
                'Толькое вегариантские блюда',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
              ),
              subtitle: Text(
                'Показать только вегатариантые блюда',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _veganFilterSet = newValue;
                });
              },
              title: Text(
                'Только веганские блюда',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
              ),
              subtitle: Text(
                'Показать только веганские блюда',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            //),
          ],
        ),
        //),
      ),
    );
  }
}
