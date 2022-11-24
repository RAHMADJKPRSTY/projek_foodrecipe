import 'package:flutter/material.dart';
import 'package:food_recipe/models/recipe.dart';
import 'package:food_recipe/views/widgets/recipe_card.dart';

class DetailRecipe extends StatelessWidget {
  final String name;
  final String images;
  final String rating;
  final String totalTime;
  final String description;
  final String videoUrl;
  final List<Instruction> instructions;
  final List<Section> sections;

  DetailRecipe({
    this.name,
    this.images,
    this.rating,
    this.totalTime,
    this.description,
    this.videoUrl,
    this.instructions,
    this.sections,
  });

  @override
  Widget build(BuildContext context) {
    List<Component> components = List.from(sections[0].components);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 5),
            Text(
              'Resep Makanan',
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              RecipeCard(
                title: name,
                cookTime: totalTime,
                rating: rating,
                thumbnailUrl: images,
                videoUrl: videoUrl,
              ),
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
                      child: Text(description,
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.justify),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Instructions',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: instructions.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(instructions[index].displayText),
                              );
                            })),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ingredients',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: components.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(components[index].rawText),
                              );
                            })),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
