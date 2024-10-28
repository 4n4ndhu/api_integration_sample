import 'package:api_integration_sample/controller/fact_list_screen_controller.dart';
import 'package:api_integration_sample/controller/home_screen_controller.dart';
import 'package:api_integration_sample/controller/news_screen_controller.dart';
import 'package:api_integration_sample/view/fact_list_screen/fact_list_screen.dart';
import 'package:api_integration_sample/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FactListScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewsScreenController(),
        )
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
