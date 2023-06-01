import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/entries/entries_response.dart';
import '../../providers/home_provider.dart';
import '../../utils/network_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getEntries();
  }

  @override
  Widget build(BuildContext context) {
    NETWORK_STATUS _status = context.watch<HomeProvider>().status;

    switch (_status) {
      case NETWORK_STATUS.IDLE:
        return const Scaffold(
          body: Center(
            child: Text("IDLE"),
          ),
        );
      case NETWORK_STATUS.LOADING:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case NETWORK_STATUS.SUCCESS:
        return Scaffold(
          body: Center(
            child: EntriesListWidget(
              list: context.read<HomeProvider>().entriesResponse.entries!,
            ),
          ),
        );
      case NETWORK_STATUS.ERROR:
        return Scaffold(
          body: Center(
            child: Text(context
                    .watch<HomeProvider>()
                    .networkError
                    ?.localizedErrorMessage ??
                'Undefined error'),
          ),
        );
    }
  }
}

class EntriesListWidget extends StatelessWidget {
  List<Entry> list;

  EntriesListWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            list[index].description ?? 'Empty',
            style: const TextStyle(fontSize: 20),
          ),
        );
      },
      scrollDirection: Axis.vertical,
    );
  }
}
