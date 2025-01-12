import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_launches/view/launches_list_view.dart';
import 'package:spacex_launches/viewmodel/launch_viewmodel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "SpaceX Launches",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: ChangeNotifierProvider<LaunchViewModel>(
            create: (BuildContext context) {
              return LaunchViewModel();
            },
            child: const LaunchesListView()),
      ),
    );
  }
}
