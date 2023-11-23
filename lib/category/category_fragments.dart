import 'package:flutter/material.dart';

import '../model/category.dart';
import 'category_item.dart';

class CategoryFragments extends StatelessWidget {
  var categoriesList = Category.getCategories();
  Function onCategoryClick;

  ///callback function
  CategoryFragments({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category\nof interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryClick(categoriesList[index]);
                  },
                  child: CategoryItem(
                      category: categoriesList[index], index: index),
                );
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
