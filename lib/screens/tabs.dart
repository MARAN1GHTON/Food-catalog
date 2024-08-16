import 'package:flutter/material.dart';
import 'package:food_catalog/data/dummy_data.dart';
import 'package:food_catalog/models/meal.dart';
import 'package:food_catalog/screens/category_view.dart';
import 'package:food_catalog/screens/filters.dart';
import 'package:food_catalog/screens/meals.dart';
import 'package:food_catalog/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    // setState(() {
    //   meal.isFavorite = !meal.isFavorite;
    // });
    // setState(() {
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        //meal.isFavorite = false;
      });
      _showInfoMessage('Чао персик, дозревай');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        // meal.isFavorite = true;
        _showInfoMessage('Опа чиназес, сюда!');
      });
    }
  }
  //);
  // }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop<Map<Filter, bool>>();
    if (identifier == "filtres") {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );
      print(result);
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
    //else {
    // Navigator.of(context).pop();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.glutenFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      availebleMeals: availableMeals,
    );
    var activePageTittle = 'Категории';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTittle = 'Избранное';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTittle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Категории"),
          BottomNavigationBarItem(icon: Icon(Icons.stars), label: "Избранное"),
        ],
      ),
    );
  }
}
