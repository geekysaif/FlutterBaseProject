import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterbaseproject/businessLogic/models/eventResponse/event_model.dart';
import '../../businessUtils/appbar/custom_appbar.dart';
import '../../businessUtils/constants/constants.dart';

// Assume this Event class is already defined above

class EventDetailsScreen extends StatelessWidget {
  final EventData event;

  const EventDetailsScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: event.title,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        CachedNetworkImage(
        imageUrl: AppStrings.demoImageUrl,
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const SizedBox(
                height: 150.0,
                child: Center(
                  child:
                  CircularProgressIndicator(),
                ),
              ),
          errorWidget:
              (context, url, error) =>
              const Center(
                child: Icon(
                  Icons.broken_image,
                  color: Colors.grey,
                  size: 50,
                ),
              ),
        ),
            const SizedBox(height: 20),
            Text(
              event.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Speaker: ${event.speakerName}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 5),
            Text('Date: ${event.date}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 5),
            Text('Time Duration: ${event.timeDurations}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 5),
            Text('Location: ${event.location}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 5),
            Text('Rating: ${event.rating}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 5),
            Text('Seats Available: ${event.seatsAvailability}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 5),

          ],
        ),
      ),
    );
  }
}
