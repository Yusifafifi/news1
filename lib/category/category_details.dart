import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../model/SourceResponse.dart';
import '../model/category.dart';
import '../tabs/tab_container.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category-details';
  Category category;

  CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Text('Something went wrong'),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.category.id);
                  },
                  child: const Text('Try Again'))
            ],
          );
        }

        /// server (success , error )
        if (snapshot.data?.status != 'ok') {
          /// error , message , code
          return Column(
            children: [
              Text(snapshot.data?.message ?? ''),
              ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
            ],
          );
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return TabContainer(
          sourceList: sourcesList,
        );
      },
    );
  }
}
