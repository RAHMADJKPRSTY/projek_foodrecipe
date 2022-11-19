import 'package:flutter/material.dart';
import 'package:food_recipe/models/recipe.api.dart';
import 'package:food_recipe/models/recipe.dart';
import 'package:food_recipe/views/detail_recipe.dart';
import 'package:food_recipe/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu_book,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Text('Buku Resep Makanan', style: TextStyle(color: Colors.black))
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images,
                      videoUrl: _recipes[index].videoUrl,
                    ),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailRecipe(
                              name: _recipes[index].name,
                              totalTime: _recipes[index].totalTime,
                              rating: _recipes[index].rating.toString(),
                              images: _recipes[index].images,
                              description: _recipes[index].description,
                              videoUrl: _recipes[index].videoUrl,
                            ),
                          )),
                    },
                  );
                },
              ));
  }
}
