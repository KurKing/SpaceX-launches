import 'package:flutter/material.dart';
import 'package:spacex_launches/model/launch_network_manager.dart';
import 'package:spacex_launches/view/launch_ui_item.dart';

class LaunchViewModel extends ChangeNotifier {
  final LaunchNetworkManager _networkManager = LaunchNetworkManager();

  List<LaunchModel> _launches = [];
  bool _isLoading = false;
  bool _reachedFinalPage = false;
  int _currentPage = -1;

  List<LaunchUiItem> get launches => _launches.map((launch) {
        return LaunchUiItem(
          missionName: "#${launch.flightNumber} ${launch.missionName}",
          launchDateString: launch.launchDateString,
          rocketName: launch.rocketName,
          thumbnailUrl: launch.thumbnailUrl,
        );
      }).toList();
  bool get isLoading => _isLoading;

  void onAppear() {
    _fetchNextLaunches();
  }

  void reachedEnd() {
    _fetchNextLaunches();
  }

  Future<void> _fetchNextLaunches() async {
    if (_isLoading || _reachedFinalPage) {
      return;
    }

    _currentPage++;
    _isLoading = true;
    notifyListeners();

    final fetchedLaunches = await _networkManager.getData(_currentPage);

    _isLoading = false;
    if (fetchedLaunches.isEmpty) {
      _reachedFinalPage = true;
    } else {
      _launches.addAll(fetchedLaunches);
    }

    notifyListeners();
  }
}
