import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Colors.pink,
  primaryContainer: Colors.pinkAccent,
  secondary: Colors.amber,
  secondaryContainer: Colors.amberAccent,
  background: Color.fromARGB(255, 33, 231, 245),
  surface: Colors.white,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onBackground: Colors.black,
  onSurface: Colors.black,
  onError: Colors.white,
);

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textTheme: GoogleFonts.latoTextTheme(),
);
