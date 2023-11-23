import 'package:flutter/material.dart';
import 'package:news1/tabs/tab_item.dart';

import '../news/news_container.dart';
import '../model/SourceResponse.dart';

class TabContainer extends StatefulWidget {
  List<Source> sourceList;

  TabContainer({super.key, required this.sourceList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.sourceList
                .map((source) => TabItem(
                    isSelected:
                        selectedIndex == widget.sourceList.indexOf(source),
                    source: source))
                .toList(),
          ),
          Expanded(
              child: NewsContainer(source: widget.sourceList[selectedIndex])),
        ],
      ),
    );
  }
}
