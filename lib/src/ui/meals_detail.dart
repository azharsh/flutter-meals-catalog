import 'package:flutter/material.dart';
import '../models/meals_detail_dao.dart';
import '../blocs/meals_detail_bloc.dart';
import '../blocs/favorite_bloc.dart';
import 'package:submission1_app/src/app_config.dart';


class DetailMeals extends StatelessWidget {
  final String id;
  MealsDetailDao mData;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  DetailMeals({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    detailBloc.fetchFoodDetail(this.id);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Meals Detail'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.limeAccent,
              ),
              onPressed: () {
                addFavoriteToDb(mData);
                showSnakbar(context, 'Add to favorite');
              },
            )
          ],
        ),
        body: StreamBuilder(
          stream: detailBloc.AllDetailFood,
          builder: (context, AsyncSnapshot<MealsDetailDao> snapshoot) {
            if (snapshoot.hasData) {
              mData = snapshoot.data;
              return detailPage(
                  snapshoot.data.meals[0].idMeal,
                  snapshoot.data.meals[0].strMealThumb,
                  snapshoot.data.meals[0].strMeal,
                  snapshoot.data.meals[0].strInstructions);
            } else if (snapshoot.hasError) {
              return Text(snapshoot.error.toString());
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  void showSnakbar(BuildContext context, String title) {
    final snackBar = SnackBar(content: Text(title));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

addFavoriteToDb(MealsDetailDao data) {
  favoriteBloc.insertfavorite(
      data.meals[0].idMeal, data.meals[0].strMeal, data.meals[0].strMealThumb);
}

Widget detailPage(String id, String imageUrl, String title, String desc) {
  return SingleChildScrollView(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 240,
            height: 240,
            child: Hero(
              tag: id,
              child: Material(
                child: InkWell(
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14),
            child: Text(
              desc,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    ),
  );
}
