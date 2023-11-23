import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import 'news_item.dart';

class NewsContainer extends StatelessWidget {
  Source source;

  NewsContainer({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(source.id ?? ""),
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
                  onPressed: () {},
                  child: const Text('Try Again'),
                ),
              ],
            );
          }

          /// server
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ""),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Try Again'),
                ),
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        });
  }
}
