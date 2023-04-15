import 'package:api_project/provider/theme_provider.dart';
import 'package:api_project/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:api_project/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyAppAux());
}

class MyAppAux extends StatelessWidget {
  const MyAppAux({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(context)),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: theme.getThemeData(),
        routes: getApplicationRoutes(),
        home: const OnboardingPage());
  }
}
