import 'package:title_grouping/lib_title_grouping/group_data.dart';

class GroupListBin extends GroupData {
  GroupListBin(this.headerName);

  String headerName;

  @override
  String toString() {
    return 'GroupListBin{headerName: $headerName}';
  }
}
