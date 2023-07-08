// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bus_reservation_udemy/models/bus_schedule.dart';
import 'package:bus_reservation_udemy/models/customer.dart';

class ReservationExapansionItem {
  ReservationExapansionHeader header;
  ReservationExpansionBody body;
  bool isExpanded;
  ReservationExapansionItem({
    required this.header,
    required this.body,
    this.isExpanded=false,
  });
}

class ReservationExapansionHeader {
  int? reservationId;
  String departuredate;
  BusSchedule schedule;
  int timestamp;
  String reservationStatus;
  ReservationExapansionHeader({
    this.reservationId,
    required this.departuredate,
    required this.schedule,
    required this.timestamp,
    required this.reservationStatus,
  });
}

class ReservationExpansionBody {
  Customer customer;
  int totalSeatedBooked;
  String seatNumbers;
  int totalPrice;
  ReservationExpansionBody({
    required this.customer,
    required this.totalSeatedBooked,
    required this.seatNumbers,
    required this.totalPrice,
  });
}
