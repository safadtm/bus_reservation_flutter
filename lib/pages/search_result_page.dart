// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bus_schedule.dart';
import '../models/bus_route.dart';
import '../providers/app_data_provider.dart';
import '../utils/constants.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    final BusRoute route = argList[0];
    final String departureDate = argList[1];

    return Scaffold(
      appBar: AppBar(title: const Text("Search Results")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Text(
            'Showing results for ${route.cityFrom} to ${route.cityTo} on $departureDate',
            style: const TextStyle(fontSize: 18),
          ),
          Consumer<AppDataProvider>(
            builder: (context, provider, _) => FutureBuilder<List<BusSchedule>>(
              future: provider.getScheduleByRouteName(route.routeName),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final scheduleList = snapshot.data;
                  return Column(
                    children: scheduleList!
                        .map(
                          (schedule) => ScheduleItemview(
                              date: departureDate, schedule: schedule),
                        )
                        .toList(),
                  );
                }
                if (snapshot.hasError) {
                  return const Text("Failed to fetch data");
                }
                return const Text("Please wait..");
              },
            ),
          )
        ],
      ),
    );
  }
}

class ScheduleItemview extends StatelessWidget {
  final String date;
  final BusSchedule schedule;
  const ScheduleItemview({
    Key? key,
    required this.date,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        routeNameSeatPlanPage,
        arguments: [schedule, date],
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(schedule.bus.busName),
              subtitle: Text(schedule.bus.busType),
              trailing: Text(
                '$currency${schedule.ticketPrice}',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "From: ${schedule.busRoute.cityFrom}",
                    style: const TextStyle(fontSize: 17),
                  ),
                  Text(
                    "To: ${schedule.busRoute.cityTo}",
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Departure Time: ${schedule.departureTime}",
                    style: const TextStyle(fontSize: 17),
                  ),
                  Text(
                    "Total Seat: ${schedule.bus.totalSeat}",
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
