import 'package:flutter/material.dart';
import 'package:meal/details.dart';
import 'package:meal/main.dart';
import 'categorydata.dart';
import 'categorymeal.dart';
import 'categorygrid.dart';

class Filter extends StatefulWidget {
  Filter({Key key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.save,
              size: 30,
            ),
            splashColor: Colors.yellow,
            onPressed: () {
              saveffects();
            }),
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Filter",
          style: TextStyle(
            fontSize: 39,
            color: Colors.yellow,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 380,
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.blueGrey,
                      child: ListTile(
                        leading: Switch(
                            activeColor: Colors.black,
                            value: vegan,
                            onChanged: (_) {
                              setState(() {
                                if (vegan == true) {
                                  vegan = false;
                                } else {
                                  vegan = true;
                                }
                              });
                            }),
                        title: Text("Vegan"),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 380,
                        child: Card(
                          elevation: 20,
                          shadowColor: Colors.blueGrey,
                          child: ListTile(
                            leading: Switch(
                                activeColor: Colors.black,
                                value: veg,
                                onChanged: (_) {
                                  setState(() {
                                    if (veg == true) {
                                      veg = false;
                                    } else {
                                      veg = true;
                                    }
                                  });
                                }),
                            title: Text("Vegitarian"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 380,
                        child: Card(
                          elevation: 20,
                          shadowColor: Colors.blueGrey,
                          child: ListTile(
                            leading: Switch(
                                activeColor: Colors.black,
                                value: lactose,
                                onChanged: (_) {
                                  setState(() {
                                    if (lactose == true) {
                                      lactose = false;
                                    } else {
                                      lactose = true;
                                    }
                                  });
                                }),
                            title: Text("lactosefree"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 380,
                        child: Card(
                          elevation: 20,
                          shadowColor: Colors.blueGrey,
                          child: ListTile(
                            leading: Switch(
                                activeColor: Colors.black,
                                value: glactose,
                                onChanged: (_) {
                                  setState(() {
                                    if (glactose == true) {
                                      glactose = false;
                                    } else {
                                      glactose = true;
                                    }
                                  });
                                }),
                            title: Text("Glactosefree"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
