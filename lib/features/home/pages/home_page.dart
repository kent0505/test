import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/others/tab_widget.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeSettings) return const SettingsPage();

              if (state is HomeActivities) return const Text('Actives');

              return const _Home();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const TabWidget(
      title1: 'Aaa',
      title2: 'Bbb',
      first: Column(
        children: [
          TextM('Aaaa', fontSize: 20),
        ],
      ),
      second: Column(
        children: [
          TextM('Bbbb', fontSize: 20),
        ],
      ),
    );
  }
}
