import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  static const routePath = '/TodosScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodosLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return Text(state.todos[index].title);
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
