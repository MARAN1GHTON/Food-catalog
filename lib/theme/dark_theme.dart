import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Colors.deepPurpleAccent,
  primaryContainer: Colors.deepPurple,
  secondary: Colors.cyanAccent,
  secondaryContainer: Colors.cyan,
  background: Colors.black,
  surface: Colors.black,
  error: Colors.redAccent,
  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onBackground: Colors.white,
  onSurface: Colors.white,
  onError: Colors.black,
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  textTheme: GoogleFonts.latoTextTheme(),
);
