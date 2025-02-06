import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'svg_widget.dart';
import 'button.dart';
import '../../blocs/navbar/navbar_bloc.dart';

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
              children: [
                _NavBarButton(
                  id: 1,
                  title: 'Home',
                  active: state is NavbarInitial,
                ),
                _NavBarButton(
                  id: 2,
                  title: '2',
                  active: state is Navbar2,
                ),
                _NavBarButton(
                  id: 3,
                  title: 'Bar chart',
                  active: state is Navbar3,
                ),
                _NavBarButton(
                  id: 4,
                  title: 'Timer',
                  active: state is Navbar4,
                ),
                _NavBarButton(
                  id: 5,
                  title: 'Wheel',
                  active: state is Navbar5,
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
    return Button(
      onPressed: active
          ? null
          : () {
              context.read<NavbarBloc>().add(ChangePage(index: id));
            },
      padding: 0,
      child: SizedBox(
        width: 62,
        child: Column(
          children: [
            const SizedBox(height: 14),
            const SvgWidget('assets/tab1.svg'),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'w700',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
