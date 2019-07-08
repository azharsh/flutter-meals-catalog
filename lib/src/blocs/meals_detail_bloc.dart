import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/meals_detail_dao.dart';


class MealsDetailBloc {
  final _repository = Repository();
  final _mealsDetailFetcher = PublishSubject<MealsDetailDao>();

  Observable<MealsDetailDao> get AllDetailFood => _mealsDetailFetcher.stream;

  fetchFoodDetail(String codeFood) async {
    MealsDetailDao mealsDetailDao = await _repository.fetchDetailFood(codeFood);
    _mealsDetailFetcher.sink.add(mealsDetailDao);
  }
  dispose() {
    _mealsDetailFetcher.close();
  }
}

final detailBloc = MealsDetailBloc();