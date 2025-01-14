import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/test/test_bloc.dart';
import '../../../core/widgets/my_button.dart';
import '../../../core/widgets/no_data.dart';

class NavbarPage2 extends StatelessWidget {
  const NavbarPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        if (state is TestLoaded) {
          if (state.models.isEmpty) {
            return const NoData();
          }

          return ListView.builder(
            itemCount: state.models.length,
            itemBuilder: (context, index) {
              return MyButton(
                onPressed: () {
                  context
                      .read<TestBloc>()
                      .add(DeleteTest(model: state.models[index]));
                },
                child: Text(
                  state.models[index].title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'w700',
                  ),
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
