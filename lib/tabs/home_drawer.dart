import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  static const categories = 1;
  static const settings = 2;
  Function onDrawerItemClick;

  HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Text(
            'News App!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(HomeDrawer.categories);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Icon(Icons.list),
                const SizedBox(width: 10),
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(HomeDrawer.settings);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(width: 10),
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
