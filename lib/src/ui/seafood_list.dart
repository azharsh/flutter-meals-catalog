import 'package:flutter/material.dart';
import '../models/meals_dao.dart';
import '../blocs/meals_bloc.dart';
import '../ui/meals_detail.dart';
import 'package:submission1_app/src/app_config.dart';


class BreakFastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: SeafoodListFiltered(),
        theme: ThemeData(primarySwatch: Colors.deepOrange));
  }
}

class SeafoodListFiltered extends StatefulWidget {
  @override
  State createState() => _StateSeafoodListFiltered();
}

class _StateSeafoodListFiltered extends State<SeafoodListFiltered> {
  final TextEditingController _filter = new TextEditingController();
  Icon _searchIcon = new Icon(Icons.search);
  String _searchText = "";
  Widget _appBarTitle = new Text('Seafood Catalogue');
  List<MealsListBean> names = new List();
  List<MealsListBean> filteredNames = new List();
  int countItem = 0;

  _StateSeafoodListFiltered() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
          countItem = filteredNames.length;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
          countItem = filteredNames.length;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.fetchFoodByType('Seafood');
    //getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: StreamBuilder(
        stream: bloc.Allfood,
        builder: (context, AsyncSnapshot<MealsDao> snapshoot) {
          if (snapshoot.hasData) {
            List<MealsListBean> tempList = new List();
            for (int i = 0; i < snapshoot.data.meals.length; i++) {
              tempList.add(snapshoot.data.meals[i]);
            }
            names = tempList;
            filteredNames = names;
            countItem = filteredNames.length;
            return buildList(context);
          } else if (snapshoot.hasError) {
            return Text(snapshoot.error.toString());
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildList(BuildContext context) {
    var config = AppConfig.of(context);
    if (!(_searchText.isEmpty)) {
      List<MealsListBean> tempList = new List();

      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]
            .strMeal
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }

      filteredNames = tempList;
      countItem = filteredNames.length;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //show count item
        Container(
            color: Colors.amber,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Text('Jumlah Item'),
                ),
                Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      countItem.toString(),
                      key: Key('countseafood'),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),

                Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      config.stringResource.APP_DESCRIPTION,
                      style:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
              ],
            )),
        Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                key: Key('gridcontentseafood'),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: names == null ? 0 : filteredNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return Hero(
                    tag: filteredNames[index].idMeal,
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          showSnakbar(context, filteredNames[index].strMeal);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailMeals(
                                      id: filteredNames[index].idMeal)));
                        },
                        child: Card(
                          elevation: 8.0,
                          child: Container(
                              child: itemConten(filteredNames[index].strMeal,
                                  filteredNames[index].strMealThumb)),
                        ),
                      ),
                    ),
                  );
                }))
      ],
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(icon: _searchIcon, onPressed: _searchPressed),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Seafood Catalogue');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  void showSnakbar(BuildContext context, String title) {
    final snackBar = SnackBar(
      content: Text(title),
    );

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Container itemConten(String title, String strImage) {
    Widget content = Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.network(
            strImage,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                title,
                style: TextStyle(fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );

    return content;
  }
}
