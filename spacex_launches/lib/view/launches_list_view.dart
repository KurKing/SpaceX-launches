import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_launches/view/launch_list_item.dart';
import 'package:spacex_launches/viewmodel/launch_viewmodel.dart';

class LaunchesListView extends StatefulWidget {
  const LaunchesListView({super.key});

  @override
  _LaunchesListViewState createState() => _LaunchesListViewState();
}

class _LaunchesListViewState extends State<LaunchesListView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LaunchViewModel>().onAppear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LaunchViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading && viewModel.launches.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return NotificationListener<ScrollEndNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels >=
                notification.metrics.maxScrollExtent) {
              context.read<LaunchViewModel>().reachedEnd();
            }
            return true;
          },
          child: ListView(children: [
            ListView.separated(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: viewModel.launches.length,
              itemBuilder: (context, index) {
                final item = viewModel.launches[index];
                return LaunchListItem(
                  item: item,
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
            ),
            if (viewModel.isLoading && viewModel.launches.isNotEmpty)
              const Center(
                  child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(strokeWidth: 2,))),
          ]),
        );
      },
    );
  }
}
