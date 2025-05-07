import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'src/core/config/constants.dart';
import 'src/core/config/router.dart';
import 'src/core/config/themes.dart';
import 'src/features/locale/bloc/locale_bloc.dart';
import 'src/features/locale/data/locale_repository.dart';
import 'src/features/timer/bloc/timer_bloc.dart';
import 'src/features/todo/data/todo_repository.dart';
import 'src/features/wheel/bloc/wheel_bloc.dart';
import 'src/features/album/bloc/album_bloc.dart';
import 'src/features/home/blocs/internet/internet_bloc.dart';
import 'src/features/home/blocs/navbar/navbar_bloc.dart';
import 'src/features/splash/data/onboard_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final prefs = await SharedPreferences.getInstance();

  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'data.db');
  // await deleteDatabase(path);
  final db = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(SQL.todos);
    },
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocaleRepository>(
          create: (context) => LocaleRepositoryImpl(prefs: prefs),
        ),
        RepositoryProvider<OnboardRepository>(
          create: (context) => OnboardRepositoryImpl(prefs: prefs),
        ),
        RepositoryProvider<TodoRepository>(
          create: (context) => TodoRepositoryImpl(db: db),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LocaleBloc(
              repository: context.read<LocaleRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => InternetBloc()..add(CheckInternet()),
          ),
          BlocProvider(create: (context) => AlbumBloc()),
          BlocProvider(create: (context) => NavbarBloc()),
          BlocProvider(create: (context) => TimerBloc()),
          BlocProvider(create: (context) => WheelBloc()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, Locale>(
      builder: (context, locale) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
          theme: lightTheme,
          routerConfig: routerConfig,
        );
      },
    );
  }
}
