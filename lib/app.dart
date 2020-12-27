import 'package:flutter/material.dart';
import 'package:meal/fav.dart';
import 'package:meal/filter.dart';
import 'package:meal/main.dart';
import 'categorygrid.dart';

class AppB extends StatefulWidget {
  const AppB({Key key}) : super(key: key);

  @override
  _AppBState createState() => _AppBState();
}

class _AppBState extends State<AppB> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoryGrid(),
      'title': 'Categories',
    },
    {
      'page': Favour(),
      'title': 'Favorite',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Center(
                child: Text(
                  "Meals",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.purple,
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  Icons.no_meals_ouline,
                  color: Colors.purple,
                  size: 50,
                ),
                title: Text(
                  "Meal",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              splashColor: Colors.purple,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Filter();
                }));
              },
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.purple,
                  size: 50,
                ),
                title: Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Meals",
          style: TextStyle(
            fontSize: 39,
            color: Colors.yellow,
          ),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
