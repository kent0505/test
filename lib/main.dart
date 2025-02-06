import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/blocs/crud/crud_bloc.dart';
import 'src/blocs/timer/timer_bloc.dart';
import 'src/blocs/wheel/wheel_bloc.dart';
import 'src/core/config/themes.dart';
import 'src/blocs/album/album_bloc.dart';
import 'src/blocs/internet/internet_bloc.dart';
import 'src/blocs/navbar/navbar_bloc.dart';
import 'src/blocs/test/test_bloc.dart';
import 'src/features/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AlbumBloc()),
        BlocProvider(create: (context) => NavbarBloc()),
        BlocProvider(create: (context) => InternetBloc()..add(CheckInternet())),
        BlocProvider(create: (context) => TestBloc()..add(GetTest())),
        BlocProvider(create: (context) => CrudBloc()..add(GetModels())),
        BlocProvider(create: (context) => TimerBloc()),
        BlocProvider(create: (context) => WheelBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: SplashPage(),
      ),
    );
  }
}
