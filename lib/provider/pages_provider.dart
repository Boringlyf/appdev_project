import 'package:appdev_project/Screens/homepage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PagesProvider with ChangeNotifier {
  List<Widget> _pages = [
    HomepageScreen(),
  ];

  List<Widget> get pages {
    return [..._pages];
  }
}
