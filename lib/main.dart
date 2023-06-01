import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bloc.dart';
import 'di/locator.dart';
import 'ui/constants/sizer/widget.dart';
import 'ui/constants/styling.dart';
import 'ui/screens/home_screen.dart';
import 'utils/environment.dart';

Future<void> main() async {
  // Load env file
  await dotenv.load(fileName: Environment.fileName);
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Blocs.providers,
      child: Sizer(builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'App demo',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('ar', ''), // Arabic, no country code
          ],
          theme: Styling.appTheme,
          home: const HomeScreen(),
        );
      }),
    );
  }
}
