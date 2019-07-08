import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/meals_dao.dart';
import '../models/meals_detail_dao.dart';

class MealsProvider {
  Client client = Client();
  static final String BASE_URL = 'https://www.themealdb.com/api/json/v1/1/';

  Future<MealsDao> fetchFood(String typeFood) async {
    final response = await client.get(BASE_URL + 'filter.php?c=$typeFood');
    print(response.body.toString());

    if (response.statusCode == 200) {
      return MealsDao.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<MealsDetailDao> fetchDetailFood(String mealCode) async {
    final response = await client.get(BASE_URL + 'lookup.php?i=$mealCode');

    if (response.statusCode == 200) {
      return MealsDetailDao.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
