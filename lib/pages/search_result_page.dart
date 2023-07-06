import 'package:bus_reservation_udemy/models/but_route.dart';
import 'package:bus_reservation_udemy/providers/app_data_provider.dart';
import 'package:bus_reservation_udemy/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    final BusRoute route = argList[0];
    final String departureDate = argList[1];
    final provider = Provider.of<AppDataProvider>(context);
    provider.getScheduleByRouteName(route.routeName);
    return Scaffold(
      appBar: AppBar(title: const Text("Search Results")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Text(
            'Showing results for ${route.cityFrom} to ${route.cityTo} on $departureDate',
            style: const TextStyle(fontSize: 18),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: provider.scheduleList
                .map(
                  (schedule) => ListTile(
                    title: Text(schedule.bus.busName),
                    subtitle: Text(schedule.bus.busType),
                 trailing: Text("$currency${schedule.ticketPrice}"), ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
