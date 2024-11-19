import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/fonts.dart';
import '../../../core/widgets/others/svg_widget.dart';
import '../../../core/widgets/buttons/my_button.dart';
import '../../../blocs/navbar/navbar_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.greenAccent,
        ),
        child: BlocBuilder<NavbarBloc, NavbarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NavBarButton(
                  id: 1,
                  title: 'Home',
                  active: state is NavbarInitial,
                ),
                _NavBarButton(
                  id: 1,
                  title: 'Actives',
                  active: state is NavbarActivities,
                ),
                _NavBarButton(
                  id: 1,
                  title: 'Settings',
                  active: state is NavbarSettings,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.id,
    required this.title,
    required this.active,
  });

  final int id;
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: active
          ? null
          : () {
              context.read<NavbarBloc>().add(ChangePageEvent(index: id));
            },
      padding: 0,
      child: SizedBox(
        width: 62,
        child: Column(
          children: [
            const SizedBox(height: 14),
            SvgWidget('assets/tab$id.svg'),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: Fonts.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
