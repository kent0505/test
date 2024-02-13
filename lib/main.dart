import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/themes.dart';
import 'core/router.dart';
import 'features/home/bloc/date/date_bloc.dart';
import 'features/home/bloc/home/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => DateBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
