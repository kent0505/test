import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/internet_widget.dart';
import '../../../blocs/navbar/navbar_bloc.dart';
import '../widgets/nav_bar.dart';
import 'initial_page.dart';
import 'navbar_page2.dart';
import 'navbar_page3.dart';
import 'navbar_page4.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                  if (state is Navbar2) return const NavbarPage2();

                  if (state is Navbar3) return const NavbarPage3();

                  if (state is Navbar4) return const NavbarPage4();

                  return const InitialPage();
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
