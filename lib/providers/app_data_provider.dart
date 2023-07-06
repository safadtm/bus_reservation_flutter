import 'package:bus_reservation_udemy/datasource/data_source.dart';
import 'package:bus_reservation_udemy/datasource/dummy_data_source.dart';
import 'package:bus_reservation_udemy/models/bus_schedule.dart';
import 'package:bus_reservation_udemy/models/but_route.dart';
import 'package:flutter/material.dart';

class AppDataProvider extends ChangeNotifier {
  List<BusSchedule> _scheduleList = [];
  List<BusSchedule> get scheduleList => _scheduleList;

  final DataSource _dataSource = DummyDataSource();

  Future<BusRoute?> getRouteByCityFromAndCityTo(
      String cityFrom, String cityTo) {
    return _dataSource.getRouteByCityFromAndCityTo(cityFrom, cityTo);
  }

  void getScheduleByRouteName(String routeName) async {
   _scheduleList= await _dataSource.getSchedulesByRouteName(routeName);
    notifyListeners();
  }
}
