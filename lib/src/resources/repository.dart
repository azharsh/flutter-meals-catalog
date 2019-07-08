import 'dart:async';
import 'meals_provider.dart';
import '../models/meals_dao.dart';
import '../models/meals_detail_dao.dart';
import 'favorite_provider.dart';
import '../models/favorite_dao.dart';

class Repository {
  final mealsProvider = MealsProvider();
  final favoriteProvider = FavoriteProvider.instance;

  Future<MealsDao> fetchFoodList(String mTypeFood) =>
      mealsProvider.fetchFood(mTypeFood);

  Future<MealsDetailDao> fetchDetailFood(String codeFood) =>
      mealsProvider.fetchDetailFood(codeFood);

  Future<int> insertFavorite(Map<String, dynamic> row) =>
      favoriteProvider.insert(row);

  Future<int> deleteFavorite(int id) => favoriteProvider.delete(id);

  Future<List<FavoriteDao>> showAllData() => favoriteProvider.queryAllRows();

  Future<int> rowCount() => favoriteProvider.queryRowCount();
}
