import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:title_grouping/lib_title_grouping/groupview_flutter.dart';
import 'grouplistbin.dart';

class GroupViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    List<GroupListBin> groupDatas = new List();
    GroupListBin groupData;

    groupData = new GroupListBin("A");
    groupData.isHeader = true;
    groupDatas.add(groupData);

    groupData = new GroupListBin("Apple");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Air");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Audition");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Address");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Administrator");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Adopt");
    groupDatas.add(groupData);

    groupData = new GroupListBin("B");
    groupData.isHeader = true;
    groupDatas.add(groupData);

    groupData = new GroupListBin("Black");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Bad");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Bridge");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Bag");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Ban");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Bar");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Back");
    groupDatas.add(groupData);

    groupData = new GroupListBin("C");
    groupData.isHeader = true;
    groupDatas.add(groupData);

    groupData = new GroupListBin("Cabinet");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Call");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Cable");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Calm");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Camp");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Camera");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Candy");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Cap");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Captain");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Capture");
    groupDatas.add(groupData);

    groupData = new GroupListBin("Car");
    groupDatas.add(groupData);
    return new GroupViewState(groupDatas);
  }
}

/// This control is suitable for ListView with fixed height
class GroupViewState extends State<GroupViewDemo> {
  GroupViewState(this.groupDatas);

  List<GroupListBin> groupDatas;
  double itemHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Demo Title Grouping"),
      ),
      body: GroupListView(
        groupDatas: groupDatas,
        generalItemChild: (GroupListBin bin) {
          return new Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: new Text(
              bin.headerName,
              style: new TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          );
        },
        headChild: (GroupListBin bin) {
          return new Container(
            color: Colors.blueAccent,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: new Text(
              bin.headerName,
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          );
        },
        scrollController: ScrollController(initialScrollOffset: 0.0),
      ),
    );
  }
}
