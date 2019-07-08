class MealsDao {
  List<MealsListBean> meals;

  MealsDao({this.meals});

  MealsDao.fromJson(Map<String, dynamic> json) {
    this.meals = (json['meals'] as List) != null
        ? (json['meals'] as List).map((i) => MealsListBean.fromJson(i)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meals'] =
        this.meals != null ? this.meals.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class MealsListBean {
  String strMeal;
  String strMealThumb;
  String idMeal;

  MealsListBean({this.strMeal, this.strMealThumb, this.idMeal});

  MealsListBean.fromJson(Map<String, dynamic> json) {
    this.strMeal = json['strMeal'];
    this.strMealThumb = json['strMealThumb'];
    this.idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strMeal'] = this.strMeal;
    data['strMealThumb'] = this.strMealThumb;
    data['idMeal'] = this.idMeal;
    return data;
  }
}
