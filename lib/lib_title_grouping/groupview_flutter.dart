import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'group_data.dart';

typedef Widget GetHearWidget<M extends GroupData>(M bin);
typedef Widget GetGeneralItem<M extends GroupData>(M bin);

class GroupView<T extends GroupData> extends StatefulWidget {
  final List<T> groupDatas;
  final GetHearWidget<T> headChild;
  final GetGeneralItem<T> generalItemChild;
  final double itemHeight;
  final double itemWidth;
  final double cacheExtent;

  GroupView({
    @required this.groupDatas,
    @required this.headChild,
    @required this.generalItemChild,
    this.itemHeight: 50.0,
    this.itemWidth: double.infinity,
    this.cacheExtent: 30.0,
  }) : assert(
          groupDatas != null,
          generalItemChild != null && headChild != null,
        );

  @override
  State<StatefulWidget> createState() {
    return GroupViewState<T>();
  }
}

/// This control is suitable for ListView with fixed height
class GroupViewState<T extends GroupData> extends State<GroupView<T>> {
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GroupListView(
          scrollController: scrollController,
          groupDatas: widget.groupDatas,
          generalItemChild: widget.generalItemChild,
          headChild: widget.headChild,
          itemHeight: widget.itemHeight,
          itemWidth: widget.itemWidth,
          cacheExtent: widget.cacheExtent,
        ),
        GestureDetector(
          onTap: () {
            double pixels = scrollController.position.pixels;
            int a = pixels ~/ widget.itemHeight;
            for (int i = a; i >= 0; i--) {
              if (widget.groupDatas[i].isHeader) {
                scrollController.animateTo(i * widget.itemHeight,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear);
                break;
              }
            }
          },
          child: HeaderView(
            scrollController: scrollController,
            headChild: widget.headChild,
            groupDatas: widget.groupDatas,
            itemWidth: widget.itemWidth,
            itemHeight: widget.itemHeight,
          ),
        ),
      ],
    );
  }
}

class GroupListView<T extends GroupData> extends StatefulWidget {
  final ScrollController scrollController;
  final double itemHeight;
  final double itemWidth;
  final double cacheExtent;
  final List<T> groupDatas;
  final GetHearWidget<T> headChild;
  final GetGeneralItem<T> generalItemChild;

  GroupListView({
    @required this.groupDatas,
    @required this.headChild,
    @required this.generalItemChild,
    this.itemHeight: 50.0,
    this.itemWidth: double.infinity,
    this.cacheExtent: 30.0,
    @required this.scrollController,
  }) : assert(
          groupDatas != null,
          generalItemChild != null && headChild != null,
        );

  @override
  State<StatefulWidget> createState() {
    return GroupListViewState<T>();
  }
}

class GroupListViewState<T extends GroupData> extends State<GroupListView<T>> {
  ScrollPhysics scrollPhysics = ClampingScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: scrollPhysics,
      cacheExtent: widget.cacheExtent,
      controller: widget.scrollController,
      itemCount: widget.groupDatas.length,
      itemBuilder: (context, index) {
        if (widget.groupDatas[index].isHeader) {
          return Container(
            width: widget.itemWidth,
            height: widget.itemHeight,
            child: widget.headChild(widget.groupDatas[index]),
          );
        } else {
          return Container(
            width: widget.itemWidth,
            height: widget.itemHeight,
            child: widget.generalItemChild(widget.groupDatas[index]),
          );
        }
      },
    );
  }
}

class HeaderView<T extends GroupData> extends StatefulWidget {
  final ScrollController scrollController;
  final double itemHeight;
  final double itemWidth;
  final GetHearWidget<T> headChild;
  final List<T> groupDatas;

  HeaderView({
    @required this.scrollController,
    this.itemHeight: 50.0,
    this.itemWidth: double.infinity,
    @required this.headChild,
    @required this.groupDatas,
  });

  @override
  State<StatefulWidget> createState() {
    return HeaderViewState<T>();
  }
}

class HeaderViewState<T extends GroupData> extends State<HeaderView<T>> {
  double headerOffset = 0.0;
  T headerStr;
  double beforeScroll = 0.0;

  @override
  void initState() {
    headerStr = widget.groupDatas.first;

    widget.scrollController.addListener(() {
      // Calculate how far it has slipped
      double pixels = widget.scrollController.position.pixels;

      // Calculate the Position of the first item that is currently visible based on the sliding distance
      int a = pixels ~/ widget.itemHeight;
      // calculate how far to slide out of the screen
      double b = pixels % widget.itemHeight;
      double currentScrollPosition =
          widget.scrollController.position.extentBefore;
      // if the next item is a header, offset
      if (widget.groupDatas[a + 1].isHeader) {
        setState(() {
          // Change layout
          if (currentScrollPosition - beforeScroll < 0) {
            // Detect if you swipe up, you will get out of the current group, change the content of the header in advance, and offset
            for (int i = a; i >= 0; i--) {
              if (widget.groupDatas[i].isHeader) {
                headerStr = widget.groupDatas[i];
                break;
              }
            }
          }
          beforeScroll = currentScrollPosition;
          headerOffset = -b;
        });
      } else {
        // Always make the header fully displayed
        for (int i = a; i >= 0; i--) {
          if (widget.groupDatas[i].isHeader) {
            if (headerStr != widget.groupDatas[i]) {
              setState(() {
                headerStr = widget.groupDatas[i];
              });
            }
            break;
          }
        }
        if (headerOffset != 0) {
          setState(() {
            headerOffset = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, headerOffset, 0.0),
      width: widget.itemWidth,
      height: widget.itemHeight,
      child: widget.headChild(headerStr),
    );
  }
}
