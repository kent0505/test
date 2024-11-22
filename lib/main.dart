import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/config/router.dart';
import 'src/core/config/themes.dart';
import 'src/blocs/album/album_bloc.dart';
import 'src/blocs/internet/internet_bloc.dart';
import 'src/blocs/navbar/navbar_bloc.dart';
import 'src/blocs/test/test_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    // precacheImages(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AlbumBloc()),
        BlocProvider(create: (context) => NavbarBloc()),
        BlocProvider(create: (context) => InternetBloc()..add(CheckInternet())),
        BlocProvider(create: (context) => TestBloc()..add(GetTestEvent())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
