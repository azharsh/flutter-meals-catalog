import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:submission1_app/src/resources/meals_provider.dart';
import 'package:submission1_app/src/models/meals_dao.dart';
import 'package:test_api/test_api.dart';

class ApiTest extends Mock implements http.Client {}

main() {
  MealsProvider provider = new MealsProvider();
  group('fetchFood', () {
    test('Mengambil data Meals dari API', () async {
      final client = ApiTest();

      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood'))
          .thenAnswer((_) async => http.Response(
              '{"meals":[{"strMeal":"Baked salmon with fennel & tomatoes","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/1548772327.jpg","idMeal":"52959"},{"strMeal":"Cajun spiced fish tacos","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/uvuyxu1503067369.jpg","idMeal":"52819"},{"strMeal":"Escovitch Fish","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/1520084413.jpg","idMeal":"52944"},{"strMeal":"Fish pie","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/ysxwuq1487323065.jpg","idMeal":"52802"},{"strMeal":"Fish Stew with Rouille","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/vptqpw1511798500.jpg","idMeal":"52918"},{"strMeal":"Garides Saganaki","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/wuvryu1468232995.jpg","idMeal":"52764"},{"strMeal":"Honey Teriyaki Salmon","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/xxyupu1468262513.jpg","idMeal":"52773"},{"strMeal":"Kedgeree","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/utxqpt1511639216.jpg","idMeal":"52887"},{"strMeal":"Kung Po Prawns","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/1525873040.jpg","idMeal":"52946"},{"strMeal":"Laksa King Prawn Noodles","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/rvypwy1503069308.jpg","idMeal":"52821"},{"strMeal":"Recheado Masala Fish","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/uwxusv1487344500.jpg","idMeal":"52809"},{"strMeal":"Salmon Avocado Salad","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/1549542994.jpg","idMeal":"52960"},{"strMeal":"Salmon Prawn Risotto","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/xxrxux1503070723.jpg","idMeal":"52823"},{"strMeal":"Saltfish and Ackee","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/vytypy1511883765.jpg","idMeal":"52936"},{"strMeal":"Seafood fideu\u00e0","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/wqqvyq1511179730.jpg","idMeal":"52836"},{"strMeal":"Shrimp Chow Fun","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/1529445434.jpg","idMeal":"52953"},{"strMeal":"Three Fish Pie","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/spswqs1511558697.jpg","idMeal":"52882"},{"strMeal":"Tuna Nicoise","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/yypwwq1511304979.jpg","idMeal":"52852"}]}',
              200));

      expect(await provider.fetchFood('Seafood'), isInstanceOf<MealsDao>());
    });

//    test('Api error', () async {
//      final client = ApiTest();
//      // Use Mockito to return an unsuccessful response when it calls the
//      // provided http.Client.
//      when(client.get(
//              'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood'))
//          .thenAnswer((_) async => http.Response('Not Found', 404));
//      expect(await provider.fetchFood('Seafood'), throwsException);
//    });
  });
}
