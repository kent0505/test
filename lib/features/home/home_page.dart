import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/trip.dart';
import '../../core/widgets/button_widget.dart';
import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/textfield_widget.dart';
import '../../core/widgets/trip_card_widget.dart';
import 'bloc/date/date_bloc.dart';
import 'bloc/home/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(LoadDataEvent(
          controller1.text,
          controller2.text,
          controller3.text,
        ));
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Поиск поездок'),
          actions: [
            BlocBuilder<DateBloc, DateState>(
              builder: (context, state) {
                if (state is DatePickedState) {
                  return Center(child: Text(state.date));
                }
                return Container();
              },
            ),
            IconButton(
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2025),
                );

                if (picked != null) {
                  final date = picked.toString().split(' ')[0];
                  controller3.text = date;
                  context.read<DateBloc>().add(PickDateEvent(date));
                }
              },
              icon: const Icon(Icons.calendar_today),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFieldWidget(
              controller: controller1,
              hintText: 'Откуда',
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: controller2,
              hintText: 'Куда',
            ),
            const SizedBox(height: 20),
            ButtonWidget(
              title: 'Найти',
              onPressed: () {
                bloc.add(LoadDataEvent(
                  controller1.text,
                  controller2.text,
                  controller3.text,
                ));
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const LoadingWidget();
                }

                if (state is HomeErrorState) {
                  return const Center(
                    child: Text('Error'),
                  );
                }

                if (state is HomeLoadedState) {
                  if (state.trips.isEmpty) {
                    return const Center(
                      child: Text('Trips not found'),
                    );
                  }
                  return Column(
                    children: [
                      for (Trip trip in state.trips) ...[
                        TripCardWidget(trip: trip),
                      ],
                    ],
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
