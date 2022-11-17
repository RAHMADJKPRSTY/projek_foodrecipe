import 'package:flutter/material.dart';
import 'package:food_recipe/views/widgets/recipe_card.dart';

class DetailRecipe extends StatelessWidget {
  final String name;
  final String images;
  final String rating;
  final String totalTime;
  final String description;

  DetailRecipe(
      {this.name, this.images, this.rating, this.totalTime, this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text('Makanan',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          RecipeCard(
              title: name,
              cookTime: totalTime,
              rating: rating,
              thumbnailUrl: images),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
