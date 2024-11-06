import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/others/tab_widget.dart';
import '../../../core/blocs/button/button_bloc.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_widget.dart';

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
              controller1,
              controller2,
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
          const TextWidget('Aaaa', fontSize: 20),
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
          PrimaryButton(
            onPressed: () {
              context.push('/albums');
            },
            title: 'Albums',
          ),
        ],
      ),
      second: const Column(
        children: [
          TextWidget('Bbbb', fontSize: 20),
        ],
      ),
    );
  }
}
