import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../widgets/internet_widget.dart';
import '../blocs/navbar/navbar_bloc.dart';
import '../widgets/nav_bar.dart';
import 'first_screen.dart';
import 'second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routePath = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: InternetWidget(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: BlocConsumer<NavbarBloc, NavbarState>(
                listener: (context, state) {
                  logger(state.runtimeType);
                },
                builder: (context, state) {
                  if (state is NavbarSecond) return const SecondScreen();

                  return const FirstScreen();
                },
              ),
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}
