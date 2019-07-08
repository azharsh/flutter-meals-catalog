class MealsDetailDao {
  List<MealsListBean> meals;

  MealsDetailDao({this.meals});

  MealsDetailDao.fromJson(Map<String, dynamic> json) {
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
  String idMeal;
  String strMeal;
  String strDrinkAlternate;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;

  MealsListBean(
      {this.idMeal,
      this.strMeal,
      this.strDrinkAlternate,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb});

  MealsListBean.fromJson(Map<String, dynamic> json) {
    this.idMeal = json['idMeal'];
    this.strMeal = json['strMeal'];
    this.strDrinkAlternate = json['strDrinkAlternate'];
    this.strCategory = json['strCategory'];
    this.strArea = json['strArea'];
    this.strInstructions = json['strInstructions'];
    this.strMealThumb = json['strMealThumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMeal'] = this.idMeal;
    data['strMeal'] = this.strMeal;
    data['strDrinkAlternate'] = this.strDrinkAlternate;
    data['strCategory'] = this.strCategory;
    data['strArea'] = this.strArea;
    data['strInstructions'] = this.strInstructions;
    data['strMealThumb'] = this.strMealThumb;
    return data;
  }
}
