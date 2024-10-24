import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/others/internet/internet_widget.dart';
import '../../../core/others/tab_widget.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: InternetWidget(
        child: Stack(
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
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return TabWidget(
      title1: 'Aaa',
      title2: 'Bbb',
      first: Column(
        children: [
          const TextM('Aaaa', fontSize: 20),
          PrimaryButton(
            onPressed: () {
              context.push('/home/test');
            },
            title: 'Test',
          ),
        ],
      ),
      second: const Column(
        children: [
          TextM('Bbbb', fontSize: 20),
        ],
      ),
    );
  }
}
