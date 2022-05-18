import 'package:flutter/material.dart';

class FavoritesGridWidget extends StatelessWidget {
  const FavoritesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: Colors.red,
      height: 700,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Favorites:",
              style: TextStyle(
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
