import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>>{
  FavoritesMealsNotifier() : super([]);


  bool toggleMealFavoriteStatus(Meal meal){ // returns false if item was removed and true if added
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
      state = [...state,meal];
      return true;
  }

}


final favoritesMealProvider = StateNotifierProvider<FavoritesMealsNotifier,List<Meal>>((ref){
    return FavoritesMealsNotifier();
});