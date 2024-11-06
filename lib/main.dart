import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/db/db.dart';
import 'src/core/utils.dart';
import 'src/core/others/button/bloc/button_bloc.dart';
import 'src/core/config/router.dart';
import 'src/core/config/themes.dart';
import 'src/core/others/album/bloc/album_bloc.dart';
import 'src/core/others/internet/bloc/internet_bloc.dart';
import 'src/features/home/bloc/home_bloc.dart';

Future<void> main() async {
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
        BlocProvider(create: (context) => ButtonBloc()),
        BlocProvider(create: (context) => AlbumBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
