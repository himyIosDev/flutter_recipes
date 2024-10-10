import 'package:flutter/material.dart';
import 'package:flutter_recepies/Pages/recipeDetail_page.dart';
import 'package:flutter_recepies/models/recipe.dart';
import 'package:flutter_recepies/services/data_service.dart';

// ***************************************************************************

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// ***************************************************************************

class _HomePageState extends State<HomePage> {
  //
  String _mealTypeFiler = "";

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      //
      appBar: AppBar(
        //
        title: const Text(
          "RecipBook",
        ),
        centerTitle: true,
      ),
      //
      body: _buildUI(),
    );
  }

  // ***************************************************************************

  Widget _buildUI() {
    //
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          //
          _recipetTypeButton(),
          _recipesList(),
        ],
      ),
    );
  }

  // ***************************************************************************

  Widget _recipetTypeButton() {
    //
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.05,
      child: ListView(
        //
        scrollDirection: Axis.horizontal,

        children: [
          //
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            //
            child: FilledButton(
              onPressed: () {
                //
                setState(() {
                  _mealTypeFiler = "snack";
                });
              },
              child: const Text(
                "🍟 Snack",
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            //
            child: FilledButton(
              onPressed: () {
                //
                setState(() {
                  _mealTypeFiler = "breakfast";
                });
              },
              child: const Text(
                "🍟 Breakfast",
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            //
            child: FilledButton(
              onPressed: () {
                //
                setState(() {
                  _mealTypeFiler = "lunch";
                });
              },
              child: const Text(
                "🍟 Lunch",
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            //
            child: FilledButton(
              onPressed: () {
                //
                //
                setState(() {
                  _mealTypeFiler = "dinner";
                });
              },
              child: const Text(
                "🍟 Dinner",
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ***************************************************************************

  Widget _recipesList() {
    //
    return Expanded(
      child: FutureBuilder(
        //
        future: DataService().getRecipes(
          _mealTypeFiler,
        ),
        builder: (context, snapshot) {
          //
          // check data connection if data is being fetched
          if (snapshot.connectionState == ConnectionState.waiting) {
            //
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // check snapshot data has any error
          if (snapshot.hasError) {
            //
            return const Center(
              child: Text("Unable to load data"),
            );
          }

          // return the view if data received
          return ListView.builder(
            //
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              //
              Recipe recipe = snapshot.data![index];
              return ListTile(
                //
                onTap: () {
                  //
                  // recipe detail screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RecipeDetailPage(recipeObj: recipe);
                      },
                    ),
                  );
                },

                // add padding
                contentPadding: const EdgeInsets.only(
                  top: 20.0,
                ),
                isThreeLine: true,

                // image handling
                leading: Image.network(recipe.image),

                // title handling
                title: Text(
                  recipe.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),

                //subtitle handling
                subtitle: Text(
                  "${recipe.cuisine}\nDifficulty: ${recipe.difficulty}",
                ),

                // rating view and text handling
                trailing: Text(
                  "${recipe.rating.toString()} ⭐️",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
