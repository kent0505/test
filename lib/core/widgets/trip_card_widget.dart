import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/trip.dart';

class TripCardWidget extends StatelessWidget {
  const TripCardWidget({
    super.key,
    required this.trip,
  });

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trip.driver1 ?? '-',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(trip.bus!.model ?? '-'),
            Text('${trip.passengerFareCost} ₽'),
            const SizedBox(height: 10),
            Text(trip.departure!.locality ?? '-'),
            Text(trip.departure!.stoppingPlace ?? '-'),
            Text(
              DateFormat('dd MMM, hh:mm').format(trip.departureTime!),
            ),
            const SizedBox(height: 10),
            Text(trip.destination!.locality ?? '-'),
            Text(trip.destination!.stoppingPlace ?? '-'),
            Text(
              DateFormat('dd MMM, hh:mm').format(trip.arrivalTime!),
            ),
          ],
        ),
      ),
    );
  }
}
