import 'package:flutter/material.dart';
import 'package:flutter_recepies/models/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  //

  final Recipe recipeObj;

  RecipeDetailPage({
    //
    required this.recipeObj,
  });

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      //
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white60,
        title: const Text("Recipe Detail"),
      ),

      //
      body: _buildUI(context),
    );
  }

  // ***************************************************************************

  Widget _buildUI(BuildContext context) {
    //
    return SingleChildScrollView(
      child: Column(
        children: [
          _recipeImage(context),
          _recipeDetail(context),
          _recipeIngredients(context),
          _recipeInstructions(context),
        ],
      ),
    );
  }

  // ***************************************************************************

  Widget _recipeImage(BuildContext context) {
    //
    return Container(
      //
      height: MediaQuery.sizeOf(context).height * 0.40,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(recipeObj.image),
        ),
      ),
    );
  }

  // ***************************************************************************

  Widget _recipeDetail(BuildContext context) {
    //
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),

      // details view handling
      child: Column(
        //
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,

        // detail data handling
        children: [
          // recipe type
          Text(
            "${recipeObj.cuisine}, ${recipeObj.difficulty}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),

          // recipe name
          Text(
            recipeObj.name,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          // prep time
          Text(
            "Prep Time: ${recipeObj.prepTimeMinutes} Minutes | Cook Time: ${recipeObj.cookTimeMinutes} Minutes",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),

          // rating
          Text(
            "${recipeObj.rating.toString()} ⭐️ | ${recipeObj.reviewCount} Reviews",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ***************************************************************************

  Widget _recipeIngredients(BuildContext context) {
    //
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),

      // details view handling
      child: Column(
        //
        // ingredients data handling
        children: recipeObj.ingredients.map((ingredient) {
          return Row(
            children: [
              const Icon(
                Icons.check_box,
              ),
              Text("  $ingredient"),
            ],
          );
        }).toList(),
      ),
    );
  }

  // ***************************************************************************

  Widget _recipeInstructions(BuildContext context) {
    //
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),

      // details view handling
      child: Column(
        //
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        // instruction data handling
        children: recipeObj.instructions.map((instruction) {
          //
          return Text(
            //
            instruction,
            maxLines: 3,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 15.0,
            ),
          );
        }).toList(),
      ),
    );
  }
}
