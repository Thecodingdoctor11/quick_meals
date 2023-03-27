import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  CategoryMealsScreen(this.availableMeals, {super.key});
  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;

  @override
  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                // removeItem: _removeMeal,
                //THE PREVIOUS LINE REMOVES THE ITEM FROM THE CATEGORY TEMPORARILY
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                affordability: displayedMeals[index].affordability,
                duration: displayedMeals[index].duration,
                complexity: displayedMeals[index].complexity,
                id: displayedMeals[index].id);
          },
          itemCount: displayedMeals.length,
        ),
      ),
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
    );
  }
}
