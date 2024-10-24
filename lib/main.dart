import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/db/db.dart';
import 'core/utils.dart';
import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/others/http/bloc/http_bloc.dart';
import 'core/others/internet/bloc/internet_bloc.dart';
import 'features/home/bloc/home_bloc.dart';

void main() async {
  await initHive();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImages(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => InternetBloc()..add(CheckInternet())),
        BlocProvider(create: (context) => HttpBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
