import 'package:appdev_project/home_screen.dart';
import 'package:appdev_project/provider/ads_provider.dart';
import 'package:appdev_project/provider/cart_provider.dart';
import 'package:appdev_project/provider/food_provider.dart';
import 'package:appdev_project/provider/pets_provider.dart';
import 'package:appdev_project/provider/vet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AdsProvider()),
        ChangeNotifierProvider(create: (context) => FoodProvider()),
        ChangeNotifierProvider(create: (context) => VetProvider()),
        ChangeNotifierProvider(create: (context) => PetsProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
