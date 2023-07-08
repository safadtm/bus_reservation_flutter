// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bus_reservation_udemy/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:bus_reservation_udemy/models/reservation_expansion_item.dart';

class ReservationItemBodyView extends StatelessWidget {
  final ReservationExpansionBody body;
  const ReservationItemBodyView({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Customer Name:${body.customer.customerName}'),
          Text('Customer Mobile:${body.customer.mobile}'),
          Text('Customer Email:${body.customer.email}'),
          Text('Total Seat:${body.totalPrice}'),
          Text('Seat Numbers:${body.seatNumbers}'),
          Text('Total Price:$currency${body.totalPrice}'),
        ],
      ),
    );
  }
}
