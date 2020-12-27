import 'package:flutter/material.dart';
import 'package:meal/categorydata.dart';
import 'package:meal/details.dart';
import 'details.dart';

class Favour extends StatefulWidget {
  const Favour({Key key}) : super(key: key);

  @override
  _FavourState createState() => _FavourState();
}

class _FavourState extends State<Favour> {
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
    void navigat(String id, String title) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Detail(id, title)),
      );
    }

    void delete(String d) {
      setState(() {
        favi.removeWhere((txt) {
          return txt.id == d;
        });
      });
    }

    return Container(
      child: favi.length == 0
          ? Center(
              child: Text(
                "NO ELEMENT IS ADDED TO FAVOURITE ITEM",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            )
          : ListView.builder(
              itemCount: favi.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      navigat(favi[index].id, favi[index].title);
                    },
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.blueGrey,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(favi[index].imageUrl),
                              Container(
                                color: Colors.black45,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    favi[index].title,
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
                                            color: Colors.pink,
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
                                        favi[index].duration.toString() + "min",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.pink,
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
                                            color: Colors.pink,
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
                                        complex(
                                            favi[index].complexity.toString()),
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.pink,
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
                                            color: Colors.pink,
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
                                        favi[index].affor,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.pink,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  splashColor: Colors.red,
                                  icon: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    delete(favi[index].id);
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
