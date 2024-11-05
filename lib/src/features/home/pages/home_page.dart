import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/others/internet/internet_widget.dart';
import '../bloc/home_bloc.dart';
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
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                logger(state.runtimeType);
              },
              builder: (context, state) {
                if (state is HomeActivities) return const ActivesPage();

                if (state is HomeSettings) return const SettingsPage();

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
