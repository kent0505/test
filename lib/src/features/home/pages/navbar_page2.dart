import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/test/test_bloc.dart';
import '../../../core/widgets/buttons/my_button.dart';

class NavbarPage2 extends StatelessWidget {
  const NavbarPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        if (state is TestLoaded) {
          return ListView.builder(
            itemCount: state.models.length,
            itemBuilder: (context, index) {
              return MyButton(
                onPressed: () {},
                child: Text(
                  state.models[index].title,
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
