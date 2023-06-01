import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/ui/screens/cubit/home/home_cubit.dart';
import '../../data/models/entries/entries_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getEntries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: _listener,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: state is HomeLoaded
              ? Center(
            child: EntriesListWidget(
              list: state.entriesResponse.entries!,
            ),
          )
              : state is HomeError
              ? Center(
            child: Text(state.networkError.localizedErrorMessage ??
                'Undefined error'),
          )
              : state is HomeLoading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : const SizedBox()
        );
      },
    );
  }

  // Widget _buildBody(var state) {
  //
  // }

  void _listener(BuildContext context, HomeState state) {
    if (state is HomeLoaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data is loaded'),
        ),
      );
    }
  }
}

class EntriesListWidget extends StatelessWidget {
  final List<Entry> list;

  const EntriesListWidget({Key? key, required this.list}) : super(key: key);

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
