import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

class FavMealNotifiaction extends StateNotifier<List<Meal>>{
  FavMealNotifiaction():super([]);
  bool checkFabMealStatus(Meal meal)
  {
    final mealIsFav =state.contains(meal);
    if(mealIsFav)
    {
      state =state.where((m) => m.id != meal.id).toList();
      return false;
    }
    else{
    state =[...state,meal];
    return true;
    }
  }


}
final favoriteMealProvider =
 StateNotifierProvider<FavMealNotifiaction,List<Meal>>((ref){
  return FavMealNotifiaction();
}); 