import 'package:flutter/material.dart';
import 'categorydata.dart';
import 'meal.dart';
import 'filter.dart';
import 'details.dart';

var _available = DUMMY_MEALS;

class CategoryMeal extends StatefulWidget {
  String id;
  String title;

  Color col;
  CategoryMeal(this.title, this.id, this.col);

  @override
  _CategoryMealState createState() => _CategoryMealState(title, id, col);
}

void saveffects() {
  _available = DUMMY_MEALS.where((et) {
    if (et.isGlutenFree != glactose) {
      return false;
    }
    if (et.isLactoseFree != lactose) {
      return false;
    }
    if (et.isVegan != vegan) {
      return false;
    }
    if (et.isVegetarian != veg) {
      return false;
    }
    return true;
  }).toList();

  print(_available.map((e) {
    return e.title;
  }).toList());
}

class _CategoryMealState extends State<CategoryMeal> {
  String id;
  String title;
  Color col;
  _CategoryMealState(this.title, this.id, this.col);
  String complex(String compl) {
    switch (compl) {
      case 'Complexity.Challenging':
        return 'hard';
        break;
      case 'Complexity.Hard':
        return 'medium';
        break;
      case 'Complexity.Simple':
        return 'simple';
        break;
      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    var details = _available.where((element) {
      return element.categories.contains(id);
    }).toList();

    void navigat(String id, String title) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Detail(id, title)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 39,
            color: col,
          ),
        ),
      ),
      body: Container(
          child: details.length == 0
              ? Center(
                  child: Text(
                    "NO ELEMENT IS THERE ACCORDING TO YOUR FILTER",
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: details.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          navigat(details[index].id, details[index].title);
                        },
                        child: Card(
                          elevation: 20,
                          shadowColor: Colors.blueGrey,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.network(details[index].imageUrl),
                                  Container(
                                    color: Colors.black45,
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Text(
                                        details[index].title,
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.schedule,
                                                color: col,
                                                size: 25,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            details[index].duration.toString() +
                                                "min",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: col,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.work,
                                                color: col,
                                                size: 25,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            complex(details[index]
                                                .complexity
                                                .toString()),
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: col,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.money,
                                                color: col,
                                                size: 25,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            details[index].affor,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: col,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
