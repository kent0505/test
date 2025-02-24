import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/core/models/todo.dart';
import 'src/core/config/constants.dart';
import 'src/core/config/themes.dart';
import 'src/blocs/crud/crud_bloc.dart';
import 'src/blocs/test/test_bloc.dart';
import 'src/features/timer/bloc/timer_bloc.dart';
import 'src/features/wheel/bloc/wheel_bloc.dart';
import 'src/features/album/bloc/album_bloc.dart';
import 'src/features/home/blocs/internet/internet_bloc.dart';
import 'src/features/home/blocs/navbar/navbar_bloc.dart';
import 'src/features/splash/data/onboard_repository.dart';
import 'src/features/splash/screens/splash_screen.dart';
import 'src/features/todo/data/todo_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk(Keys.todosBox);
  Hive.registerAdapter(TodoAdapter());
  final prefs = await SharedPreferences.getInstance();
  final box = await Hive.openBox(Keys.todosBox);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<OnboardRepository>(
          create: (context) => OnboardRepositoryImpl(prefs: prefs),
        ),
        RepositoryProvider<TodoRepository>(
          create: (context) => TodoRepositoryImpl(box: box),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AlbumBloc()),
          BlocProvider(create: (context) => NavbarBloc()),
          BlocProvider(
              create: (context) => InternetBloc()..add(CheckInternet())),
          BlocProvider(create: (context) => TestBloc()..add(GetTest())),
          BlocProvider(create: (context) => CrudBloc()..add(GetModels())),
          BlocProvider(create: (context) => TimerBloc()),
          BlocProvider(create: (context) => WheelBloc()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: SplashScreen(),
    );
  }
}
