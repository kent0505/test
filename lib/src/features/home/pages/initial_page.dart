import 'package:flutter/cupertino.dart';
import 'package:shablon/src/core/widgets/text_anim.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/ios_date_picker.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/switch_button.dart';
import '../../../core/widgets/txt_field.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool isActive = false;
  bool testBool1 = false;
  bool testBool2 = false;

  void checkActive(String value) {
    setState(() {
      isActive = [
        controller1,
        controller2,
        controller3,
      ].every((element) => element.text.isNotEmpty);
    });
  }

  void onPick(bool timePicker) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return IosDatePicker(
          timePicker: timePicker,
          initialDateTime: timePicker ? null : stringToDate(controller2.text),
          onDateTimeChanged: (value) {
            timePicker
                ? controller3.text = timeToString(value)
                : controller2.text = dateToString(value);
            checkActive('');
          },
        );
      },
    );
  }

  void onSwitch1() {
    testBool1 = !testBool1;
    setState(() {});
  }

  void onSwitch2() {
    testBool2 = !testBool2;
    setState(() {});
  }

  void onAdd() {
    logger(controller1.text);
    logger(controller2.text);
    logger(controller3.text);
    logger(testBool1);
    logger(testBool2);
    // final model = TestModel(
    //   id: getTimestamp(),
    //   title: controller1.text,
    // );
    // context.read<TestBloc>().add(AddTest(model: model));
    // context.read<NavbarBloc>().add(ChangePage(index: 2));
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 60,
      ),
      children: [
        TxtField(
          controller: controller1,
          hintText: 'Title',
          onChanged: checkActive,
        ),
        const SizedBox(height: 20),
        TxtField(
          controller: controller2,
          hintText: 'Date',
          readOnly: true,
          onTap: () {
            onPick(false);
          },
        ),
        const SizedBox(height: 20),
        TxtField(
          controller: controller3,
          hintText: 'Time',
          readOnly: true,
          onTap: () {
            onPick(true);
          },
        ),
        const SizedBox(height: 20),
        MainButton(
          onPressed: onAdd,
          isActive: isActive,
          title: 'Add',
        ),
        const SizedBox(height: 20),
        SwitchButton(
          isActive: testBool1,
          onPressed: onSwitch1,
        ),
        const SizedBox(height: 10),
        SwitchButton(
          isActive: testBool2,
          onPressed: onSwitch2,
        ),
        const SizedBox(height: 20),
        TextAnim(title: testBool2 ? '1000' : '500'),
        const SizedBox(height: 20),
        LoadingWidget(),
        const SizedBox(height: 20),
        LoadingWidget2(loading: testBool1),
        const SizedBox(height: 20),
        LoadingWidget3(),
        const SizedBox(height: 20),
      ],
    );
  }
}
