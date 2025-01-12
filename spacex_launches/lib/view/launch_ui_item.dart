class LaunchUiItem {
  final String missionName;
  final String launchDateString;
  final String rocketName;

  final String? thumbnailUrl;

  LaunchUiItem(
      {required this.missionName,
      required this.launchDateString,
      required this.rocketName,
      required this.thumbnailUrl});
}
