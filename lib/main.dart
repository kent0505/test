import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/core/config/router.dart';
import 'src/core/config/themes.dart';
import 'src/features/timer/bloc/timer_bloc.dart';
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

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<OnboardRepository>(
          create: (context) => OnboardRepositoryImpl(prefs: prefs),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: routerConfig,
    );
  }
}
