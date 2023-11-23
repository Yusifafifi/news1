import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/NewsResponse.dart';
import '../my_theme.dart';
import 'details_screen.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(NewsDetailsScreen.routeName, arguments: news),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              news.author ?? "",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MyTheme.greyColor,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              news.title ?? "",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              news.publishedAt ?? "",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MyTheme.greyColor,
                  ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
