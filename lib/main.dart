import 'package:appdev_project/Screens/google_signin.dart';
import 'package:appdev_project/home_screen.dart';
import 'package:appdev_project/provider/ads_provider.dart';
import 'package:appdev_project/provider/cart_provider.dart';
import 'package:appdev_project/provider/food_provider.dart';
import 'package:appdev_project/provider/gadgets_provider.dart';
import 'package:appdev_project/provider/order_provider.dart';
import 'package:appdev_project/provider/pets_provider.dart';
import 'package:appdev_project/provider/vet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAV8wSBJoi7U7KEKzWltdo7Qc97LQm3TAg",
      appId: "XXX",
      messagingSenderId: "XXX",
      projectId: "XXX",
    ),
  );
  Stripe.publishableKey =
      'pk_test_51L1rF0G96NCu7hWdpEdNElSMIXhvDhoFCm0qLhykoEMBU8x5ncuN4FU4Rt7XGBFySkdqIU4rvPj3LM9WlQayz5Rb00YcqqlVMU';
  await Stripe.instance.applySettings();
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
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => GadgetsProvider()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider())
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
