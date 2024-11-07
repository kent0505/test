import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/others/svg_widget.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_widget.dart';
import '../../../blocs/navbar/navbar_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 70,
        color: AppColors.main,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<NavbarBloc, NavbarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NavBarButton(
                  title: 'Home',
                  asset: 'tab1',
                  active: state is NavbarInitial,
                  onPressed: () {
                    context.read<NavbarBloc>().add(ChangePageEvent(index: 0));
                  },
                ),
                _NavBarButton(
                  title: 'Actives',
                  asset: 'tab1',
                  active: state is NavbarActivities,
                  onPressed: () {
                    context.read<NavbarBloc>().add(ChangePageEvent(index: 1));
                  },
                ),
                _NavBarButton(
                  title: 'Settings',
                  asset: 'tab1',
                  active: state is NavbarSettings,
                  onPressed: () {
                    context.read<NavbarBloc>().add(ChangePageEvent(index: 2));
                  },
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
    required this.title,
    required this.asset,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: onPressed,
      padding: 0,
      child: SizedBox(
        width: 62,
        child: Column(
          children: [
            const SizedBox(height: 14),
            SvgWidget(
              'assets/$asset.svg',
              color: active ? null : Colors.white.withOpacity(0.5),
            ),
            const SizedBox(height: 3),
            TextWidget(
              title,
              fontSize: 10,
            ),
          ],
        ),
      ),
    );
  }
}
