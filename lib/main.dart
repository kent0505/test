import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/utils.dart';
import 'src/core/config/router.dart';
import 'src/core/config/themes.dart';
import 'src/blocs/album/album_bloc.dart';
import 'src/blocs/button/button_bloc.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImages(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AlbumBloc()),
        BlocProvider(create: (context) => ButtonBloc()),
        BlocProvider(create: (context) => InternetBloc()..add(CheckInternet())),
        BlocProvider(create: (context) => NavbarBloc()),
        BlocProvider(create: (context) => TestBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
