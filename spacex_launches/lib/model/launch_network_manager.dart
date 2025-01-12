import 'package:http/http.dart' as http;
import 'dart:convert';

class LaunchModel {
  final int flightNumber;
  final String missionName;
  final String launchDateString;
  final String rocketName;

  final String thumbnailUrl;

  LaunchModel(
      {required this.flightNumber,
      required this.missionName,
      required this.launchDateString,
      required this.rocketName,
      required this.thumbnailUrl});
}

class LaunchNetworkManager {
  final String baseURL = 'https://api.spacexdata.com/v3/launches';
  final _limit = 15;

  Future<List<LaunchModel>> getData(int page) async {
    http.Response response =
        await http.get(Uri.parse(_requestURL(page * _limit)));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data
          .map((launchJson) => LaunchModel(
                flightNumber: launchJson['flight_number'],
                missionName: launchJson['mission_name'],
                launchDateString: launchJson['launch_date_utc'],
                rocketName: launchJson['rocket']['rocket_name'],
                thumbnailUrl: launchJson['links']['mission_patch_small'],
              ))
          .toList();
    }

    return List.empty();
  }

  String _requestURL(int offset) {
    return '$baseURL?limit=$_limit&offset=$offset';
  }
}
