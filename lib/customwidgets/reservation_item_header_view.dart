// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bus_reservation_udemy/utils/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:bus_reservation_udemy/models/reservation_expansion_item.dart';

class ReservationItemHeaderView extends StatelessWidget {
  final ReservationExapansionHeader header;
  const ReservationItemHeaderView({
    Key? key,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('${header.departuredate} ${header.schedule.departureTime}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${header.schedule.busRoute.routeName}-${header.schedule.bus.busType}'),
            Text('Booking Time:${getFormattedDate(DateTime.fromMillisecondsSinceEpoch(header.timestamp),pattern: 'EEE MMM dd yyyy HH:mm',)}'),
          ],
        ),
      ),
    );
  }
}