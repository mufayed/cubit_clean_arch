import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/di/locator.dart';
import 'package:project_name/ui/screens/cubit/home/home_cubit.dart';
import 'package:provider/single_child_widget.dart';

class Blocs {
  static final List<SingleChildWidget> providers = [
    BlocProvider(
      create: (context) => HomeCubit(locator()),
    ),
  ];
}
