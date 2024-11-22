import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/navbar/navbar_bloc.dart';
import '../../../blocs/test/test_bloc.dart';
import '../../../core/models/test_model.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/main_button.dart';
import '../../../core/widgets/textfields/txt_field.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  final isActive = ValueNotifier(false);
  final controller = TextEditingController();

  void checkActive() {
    isActive.value = controller.text.isNotEmpty;
  }

  void onAdd() {
    final model = TestModel(
      id: getTimestamp(),
      title: controller.text,
    );
    context.read<TestBloc>().add(AddTest(model: model));
    context.read<NavbarBloc>().add(ChangePage(index: 2));
  }

  @override
  void dispose() {
    isActive.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TxtField(
          controller: controller,
          hintText: 'Title',
          onChanged: checkActive,
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder<bool>(
          valueListenable: isActive,
          builder: (context, value, child) {
            return MainButton(
              onPressed: onAdd,
              isActive: value,
              title: 'Add',
            );
          },
        ),
      ],
    );
  }
}
