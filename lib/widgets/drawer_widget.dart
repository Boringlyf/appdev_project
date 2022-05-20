import 'package:appdev_project/Screens/cart_screen.dart';
import 'package:appdev_project/Screens/loginPage.dart';
import 'package:appdev_project/Screens/orders_screen.dart';
import 'package:appdev_project/Screens/signupPage.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              title: Text('HOME'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/'),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('ORDERS'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OrdersScreen())),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('CART'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartScreen())),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('LOGIN'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage())),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('SIGNUP'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignupPage())),
            ),
          ],
        ),
      ),
    );
  }
}
