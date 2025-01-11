import 'package:flutter/material.dart';
import 'package:spacex_launches/view/launch_ui_item.dart';

import 'launch_list_item.dart';

class LaunchesListView extends StatelessWidget {
  final List<LaunchUiItem> _mockLaunches = [
    LaunchUiItem(
      missionName: "FalconSat",
      launchDateString: "2006-03-24",
      rocketName: "Falcon 1",
      thumbnailUrl: "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
    ),
    LaunchUiItem(
      missionName: "DemoSat",
      launchDateString: "2007-03-21",
      rocketName: "Falcon 1",
      thumbnailUrl: "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
    ),
    LaunchUiItem(
      missionName: "Trailblazer",
      launchDateString: "2008-08-02",
      rocketName: "Falcon 1",
      thumbnailUrl: "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
    ),
    LaunchUiItem(
      missionName: "RatSat",
      launchDateString: "2008-09-28",
      rocketName: "Falcon 1",
      thumbnailUrl: "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
    ),
    LaunchUiItem(
      missionName: "RazakSat",
      launchDateString: "2009-07-14",
      rocketName: "Falcon 1",
      thumbnailUrl: "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
    ),
    LaunchUiItem(
      missionName: "Falcon 9 Test Flight",
      launchDateString: "2010-06-04",
      rocketName: "Falcon 9",
      thumbnailUrl: "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
    ),
    LaunchUiItem(
      missionName: "COTS 1",
      launchDateString: "2010-12-08",
      rocketName: "Falcon 9",
      thumbnailUrl: "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
    ),
    LaunchUiItem(
      missionName: "COTS 2",
      launchDateString: "2012-05-22",
      rocketName: "Falcon 9",
      thumbnailUrl: "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
    ),
    LaunchUiItem(
      missionName: "CRS-1",
      launchDateString: "2012-10-08",
      rocketName: "Falcon 9",
      thumbnailUrl: "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
    ),
    LaunchUiItem(
      missionName: "CRS-2",
      launchDateString: "2013-03-01",
      rocketName: "Falcon 9",
      thumbnailUrl: "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
    ),
  ];

  LaunchesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _mockLaunches.length,
      itemBuilder: (context, index) {
        final item = _mockLaunches[index];
        return LaunchListItem(
          item: item,
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey.shade300,
        thickness: 1,
      ),
    );
  }
}
