import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:title_grouping/lib_title_grouping/groupview_flutter.dart';
import 'grouplistbin.dart';

class GroupViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    List<GroupListBin> groupDatas = List();
    GroupListBin groupData;

    groupData = GroupListBin("A");
    groupData.isHeader = true;
    groupDatas.add(groupData);

    groupData = GroupListBin("Apple");
    groupDatas.add(groupData);

    groupData = GroupListBin("Air");
    groupDatas.add(groupData);

    groupData = GroupListBin("Audition");
    groupDatas.add(groupData);

    groupData = GroupListBin("Address");
    groupDatas.add(groupData);

    groupData = GroupListBin("Administrator");
    groupDatas.add(groupData);

    groupData = GroupListBin("Adopt");
    groupDatas.add(groupData);

    groupData = GroupListBin("B");
    groupData.isHeader = true;
    groupDatas.add(groupData);

    groupData = GroupListBin("Black");
    groupDatas.add(groupData);

    groupData = GroupListBin("Bad");
    groupDatas.add(groupData);

    groupData = GroupListBin("Bridge");
    groupDatas.add(groupData);

    groupData = GroupListBin("Bag");
    groupDatas.add(groupData);

    groupData = GroupListBin("Ban");
    groupDatas.add(groupData);

    groupData = GroupListBin("Bar");
    groupDatas.add(groupData);

    groupData = GroupListBin("Back");
    groupDatas.add(groupData);

    groupData = GroupListBin("C");
    groupData.isHeader = true;
    groupDatas.add(groupData);

    groupData = GroupListBin("Cabinet");
    groupDatas.add(groupData);

    groupData = GroupListBin("Call");
    groupDatas.add(groupData);

    groupData = GroupListBin("Cable");
    groupDatas.add(groupData);

    groupData = GroupListBin("Calm");
    groupDatas.add(groupData);

    groupData = GroupListBin("Camp");
    groupDatas.add(groupData);

    groupData = GroupListBin("Camera");
    groupDatas.add(groupData);

    groupData = GroupListBin("Candy");
    groupDatas.add(groupData);

    groupData = GroupListBin("Cap");
    groupDatas.add(groupData);

    groupData = GroupListBin("Captain");
    groupDatas.add(groupData);

    groupData = GroupListBin("Capture");
    groupDatas.add(groupData);

    groupData = GroupListBin("Car");
    groupDatas.add(groupData);
    return GroupViewState(groupDatas);
  }
}

/// This control is suitable for ListView with fixed height
class GroupViewState extends State<GroupViewDemo> {
  GroupViewState(this.groupDatas);

  List<GroupListBin> groupDatas;
  double itemHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Title Grouping"),
      ),
      body: GroupListView(
        groupDatas: groupDatas,
        generalItemChild: (GroupListBin bin) {
          return Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: Text(
              bin.headerName,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          );
        },
        headChild: (GroupListBin bin) {
          return Container(
            color: Colors.blueAccent,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: Text(
              bin.headerName,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          );
        },
        scrollController: ScrollController(initialScrollOffset: 0.0),
      ),
    );
  }
}
