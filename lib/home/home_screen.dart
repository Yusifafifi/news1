import 'package:flutter/material.dart';


import '../category/category_details.dart';
import '../category/category_fragments.dart';
import '../model/category.dart';
import '../my_theme.dart';
import '../news/search_delegate.dart';
import '../settings/settings_tab.dart';
import '../tabs/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              'assets/images/main_background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () => showSearch(
                        context: context,
                        delegate: NewsSearchDelegate(),
                      ),
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
            title: Text(
              selectedDrawerItem == HomeDrawer.settings
                  ? 'Settings'
                  : selectedCategory == null
                      ? 'News App'
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(onDrawerItemClick: onDrawerItemClick),
          ),
          body: selectedDrawerItem == HomeDrawer.settings
              ? const SettingsTab()
              : selectedCategory == null
                  ? CategoryFragments(onCategoryClick: onCategoryClick)
                  : CategoryDetails(category: selectedCategory!),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedDrawerItem = HomeDrawer.categories;

  void onDrawerItemClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
