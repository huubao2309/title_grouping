# Title Grouping List

## Title Grouping List:

![Title Grouping](https://github.com/huubao2309/title_grouping/blob/master/images/demo_grouping_title.gif)


### Use `GroupListView`:

```dart
      child: GroupListView(
        groupDatas: groupDatas, // Item Source
        generalItemChild: (GroupListBin bin) {
          return Container(
            // Body GroupListView
          );
        },
        headChild: (GroupListBin bin) {
          return Container(
            // Header GroupListView
          );
        },
        scrollController: ScrollController(initialScrollOffset: 0.0),
      ),
```
