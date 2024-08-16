import 'package:flutter/material.dart';
//import 'package:food_catalog/data/dummy_data.dart';
//import 'package:food_catalog/screens/category_view.dart';
import 'package:food_catalog/screens/tabs.dart';
//import 'package:food_catalog/screens/meals.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:food_catalog/theme/dark_theme.dart';

//import 'package:meals/screens/tabs.dart';

//final theme = ThemeData(
// useMaterial3: true,
// colorScheme: ColorScheme.fromSeed(
//  brightness: Brightness.dark,
// seedColor: const Color.fromARGB(255, 70, 21, 148),
//),
//textTheme: GoogleFonts.latoTextTheme(),
//);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home:
          //const MealsScreen(meals: dummyMeals, title: 'Какое-то название')
          const TabsScreen(),
    );
  }
}
