import '../blocs/favorite_bloc.dart';
import 'package:flutter/material.dart';
import '../models/favorite_dao.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite'),
        ),
        body: FavoriteList());
  }
}

class FavoriteList extends StatefulWidget {
  @override
  State createState() => _StateFavoriteList();
}

class _StateFavoriteList extends State<FavoriteList> {
  Future<List<FavoriteDao>> dataFavorite;


  @override
  void initState() {
    // TODO: implement initState
    dataFavorite = favoriteBloc.showAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List<FavoriteDao>>(
        future: dataFavorite,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return new Text('Error ${snapshot.error}');
          else
            return ListView.builder(
              key: Key('listcontentfavorite'),
                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 4,
                      child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Image.network(
                                snapshot.data[index].urlImge,
                                height: 70,
                                width: 70,
                              ),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(left: 12),
                                      child: Text(snapshot.data[index].name))),
                              IconButton(
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  favoriteBloc
                                      .deleteFav(snapshot.data[index].id);
                                  setState(() {
                                    dataFavorite = favoriteBloc.showAllData();
                                  });
                                },
                              )
                            ],
                          )));
                });
        });
  }
}
