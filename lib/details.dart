import 'package:flutter/material.dart';
import 'package:meal/app.dart';
import 'package:meal/categorydata.dart';
import 'package:meal/fav.dart';
import 'package:meal/meal.dart';

class Detail extends StatefulWidget {
  String id;
  String title;

  Detail(this.id, this.title);

  @override
  _DetailState createState() => _DetailState(this.id, this.title);
}

class _DetailState extends State<Detail> {
  String id;
  String title;

  _DetailState(this.id, this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: details(id, title),
    );
  }
}

class details extends StatefulWidget {
  String id;
  String title;

  details(this.id, this.title);

  @override
  _detailsState createState() => _detailsState(this.id, this.title);
}

List<Meal> favi = [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c2',
      'c3',
    ],
    title: 'Classic Hamburger',
    affordability: Affordability.Pricey,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    duration: 45,
    ingredients: [
      '300g Cattle Hack',
      '1 Tomato',
      '1 Cucumber',
      '1 Onion',
      'Ketchup',
      '2 Burger Buns'
    ],
    steps: [
      'Form 2 patties',
      'Fry the patties for c. 4 minutes on each side',
      'Quickly fry the buns for c. 1 minute on each side',
      'Bruch buns with ketchup',
      'Serve burger with tomato, cucumber and onion'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
];

class _detailsState extends State<details> {
  var id;
  String title;
  _detailsState(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    var iteam = DUMMY_MEALS.where((element) {
      return element.title.contains(title);
    }).toList();

    bool check(String d) {
      for (var i = 0; i < favi.length; ++i) {
        if (favi[i].id == d) {
          return true;
        }
      }
      return false;
    }

    var disable = false;
    void savefav(
      String d,
      var c,
      String t,
      String url,
      var ind,
      var st,
      var dur,
      var com,
      var aff,
      var gf,
      var lf,
      var v,
      var vg,
    ) {
      var nw = Meal(
        id: d,
        categories: c,
        title: t,
        imageUrl: url,
        ingredients: ind,
        steps: st,
        duration: dur,
        complexity: com,
        affordability: aff,
        isGlutenFree: gf,
        isLactoseFree: lf,
        isVegan: v,
        isVegetarian: vg,
      );
      setState(() {
        disable = true;
        print(favi.map((e) {
          return e.title;
        }).toList());
        if (check(d)) {
          print("already there");
          return;
        } else {
          favi.add(nw);
        }
      });
    }

    return Container(
        child: ListView.builder(
      itemCount: iteam.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 20,
          shadowColor: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 400,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(iteam[index].imageUrl),
                      Container(
                        color: Colors.black45,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            iteam[index].title,
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
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.star,
                            color: check(iteam[index].id)
                                ? Colors.yellow
                                : Colors.grey,
                          ),
                          onPressed: check(iteam[index].id)
                              ? null
                              : () {
                                  savefav(
                                    iteam[index].id,
                                    iteam[index].categories,
                                    iteam[index].title,
                                    iteam[index].imageUrl,
                                    iteam[index].ingredients,
                                    iteam[index].steps,
                                    iteam[index].duration,
                                    iteam[index].complexity,
                                    iteam[index].affordability,
                                    iteam[index].isGlutenFree,
                                    iteam[index].isLactoseFree,
                                    iteam[index].isVegan,
                                    iteam[index].isVegetarian,
                                  );
                                },
                          iconSize: 70,
                          splashColor: Colors.yellow,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 170,
                                  child: ListTile(
                                    leading: iteam[index].isVegan
                                        ? Icon(
                                            Icons.beenhere,
                                            color: Colors.green,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.backspace,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                    title: Text("vegan"),
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  child: ListTile(
                                    leading: iteam[index].isVegetarian
                                        ? Icon(
                                            Icons.beenhere,
                                            color: Colors.green,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.backspace,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                    title: Text('Vegetarian'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 170,
                                  child: ListTile(
                                    leading: iteam[index].isGlutenFree
                                        ? Icon(
                                            Icons.beenhere,
                                            color: Colors.green,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.backspace,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                    title: Text("GlutenFree"),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: ListTile(
                                    leading: iteam[index].isLactoseFree
                                        ? Icon(
                                            Icons.beenhere,
                                            color: Colors.green,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.backspace,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                    title: Text("LactoseFree"),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Ingredients",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    child: ListView.builder(
                        itemCount: iteam[index].ingredients.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Card(
                              color: Colors.white,
                              elevation: 10,
                              shadowColor: Colors.blueGrey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      iteam[index].ingredients[i],
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.pink,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Steps",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount: iteam[index].steps.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Card(
                              color: Colors.white,
                              elevation: 20,
                              shadowColor: Colors.black54,
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        (i + 1).toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          iteam[index].steps[i],
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 100,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
