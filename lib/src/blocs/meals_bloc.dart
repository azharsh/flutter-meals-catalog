import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/meals_dao.dart';

class MealsBloc {
  final _repository = Repository();
  final _mealsFetcher = PublishSubject<MealsDao>();

  Observable<MealsDao> get Allfood => _mealsFetcher.stream;

  fetchFoodByType(String foodType) async {
    MealsDao mealsDao = await _repository.fetchFoodList(foodType);
    _mealsFetcher.sink.add(mealsDao);
  }



  dispose() {
    _mealsFetcher.close();
  }
}

final bloc = MealsBloc();
