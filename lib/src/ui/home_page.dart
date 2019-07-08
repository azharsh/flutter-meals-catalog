import 'package:flutter/material.dart';
import '../ui/seafood_list.dart';
import '../ui/desert_list.dart';
import '../ui/favorite_list.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cIndex = 0;
  final List<Widget> _children = [
    DesertList(),
    BreakFastList(),
    FavoritePage()
  ];

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_cIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.fastfood,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              title: new Text(
                'Desert',
                style: TextStyle(color: Colors.black54),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ac_unit,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              title:
                  new Text('Seafood', style: TextStyle(color: Colors.black54))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              title: new Text('Favorite',
                  style: TextStyle(color: Colors.black54))),
        ],
        onTap: (index) {
          _incrementTab(index);
        },

      ),
    );
  }
}
