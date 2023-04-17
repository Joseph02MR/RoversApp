import 'package:flutter/material.dart';

class StylesSettings {
  static ThemeData lightTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    final theme = ThemeData.dark();
    return theme.copyWith(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 42, 16, 87)),
      useMaterial3: true,
    );
  }
}

const Color ligthPurple = Colors.deepPurple;
const Color darkPurple = Color.fromARGB(255, 42, 16, 87);

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(0, 10, 209, 1),
  Color.fromRGBO(2, 10, 207, 1),
  Color.fromRGBO(2, 10, 192, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}
