import 'package:flutter/material.dart';
import 'package:meal/category.dart';
import 'package:meal/categorydata.dart';
import 'package:meal/categorymeal.dart';
import 'main.dart';

class CategoryGrid extends StatefulWidget {
  CategoryGrid({Key key}) : super(key: key);

  @override
  _CategoryGridState createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  Widget build(BuildContext context) {
    void navigator(String title, String id, Color col) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoryMeal(title, id, col)),
      );
    }

    Widget category(String id, String text, Color col) {
      return InkWell(
        onTap: () {
          navigator(
            text,
            id,
            col,
          );
        },
        splashColor: Colors.white,
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              col.withOpacity(0.8),
              col,
            ]),
            borderRadius: BorderRadius.circular(20),
            color: col,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 500,
              child: GridView(
                children: DUMMY_CATEGORIES.map((e) {
                  return category(e.id, e.title, e.color);
                }).toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
