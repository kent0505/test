import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/others/tab_widget.dart';
import '../../../blocs/button/button_bloc.dart';
import '../../../core/widgets/buttons/main_button.dart';
import '../../../core/widgets/textfields/txt_field.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  void checkActive() {
    context.read<ButtonBloc>().add(
          CheckButtonActive(
            controllers: [
              controller1.text,
              controller2.text,
            ],
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    checkActive();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabWidget(
      title1: 'Aaa',
      title2: 'Bbb',
      first: Column(
        children: [
          const Text(
            'Aaaa',
          ),
          TxtField(
            controller: controller1,
            hintText: 'Aaa',
            onChanged: checkActive,
          ),
          TxtField(
            controller: controller2,
            hintText: 'Bbb',
            onChanged: checkActive,
          ),
          MainButton(
            onPressed: () {
              context.push('/albums');
            },
            title: 'Albums',
          ),
          Text(
            formatNumber(1000000),
          ),
        ],
      ),
      second: const Column(
        children: [
          Text(
            'Bbbb',
          ),
        ],
      ),
    );
  }
}
