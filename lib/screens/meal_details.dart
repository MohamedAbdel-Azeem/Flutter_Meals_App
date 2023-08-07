import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavorite(meal);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            meal.imageUrl,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "Ingredients",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          for (final ingredient in meal.ingredients)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
            ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Steps",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          for (int i = 0; i < meal.steps.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text("${i + 1}- ${meal.steps[i]}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
              ),
            ),
        ],
      ),
    );
  }
}
