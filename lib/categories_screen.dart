import 'package:flutter/material.dart';
import './dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliMeals')),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...DUMMY_CATEGORIES
              .map((catData) => Categoryitem(
                    catData.title,
                    catData.color,
                  ))
              .toList(),
        ],
      ),
    );
  }
}
