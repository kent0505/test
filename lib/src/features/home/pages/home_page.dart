import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/others/internet_widget.dart';
import '../../../blocs/navbar/navbar_bloc.dart';
import '../widgets/nav_bar.dart';
import 'actives_page.dart';
import 'main_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: InternetWidget(
        child: Stack(
          children: [
            BlocConsumer<NavbarBloc, NavbarState>(
              listener: (context, state) {
                logger(state.runtimeType);
              },
              builder: (context, state) {
                if (state is NavbarActivities) return const ActivesPage();

                if (state is NavbarSettings) return const SettingsPage();

                return const MainPage();
              },
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}
