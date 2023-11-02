import 'package:flutter/material.dart';
import 'package:lumberjack/app/router.dart';
import 'package:lumberjack/services/game_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:lumberjack/states/loading_state.dart';
import 'package:provider/provider.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<GameService>(GameService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<LoadingState>(
        create: (_) => LoadingState(false),
        child: MaterialApp.router(
          title: 'Lumberjack',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(236, 0, 0, 1),
            ),
            brightness: Brightness.light,
            useMaterial3: true,
            textTheme: Typography.blackCupertino,
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('pt', ''),
          ],
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
