import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen(this.favoriteMeals, {super.key});
  final List<Meal> favoriteMeals;
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no Favorites yet.'),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              affordability: favoriteMeals[index].affordability,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              id: favoriteMeals[index].id);
        }),
        itemCount: favoriteMeals.length,
      );
    }
  }
}
