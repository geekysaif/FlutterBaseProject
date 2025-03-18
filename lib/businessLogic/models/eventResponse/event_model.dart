class EventData {
  final String date;
  final String timeDurations;
  final String location;
  final String title;
  final String speakerImage;
  final String speakerName;
  final String sponsorName;
  final double rating;
  final String seatsAvailability;
  final String sortingDate;

  EventData({
    required this.date,
    required this.timeDurations,
    required this.location,
    required this.title,
    required this.speakerImage,
    required this.speakerName,
    required this.sponsorName,
    required this.rating,
    required this.seatsAvailability,
    required this.sortingDate,
  });

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      date: json['date'],
      timeDurations: json['time_durations'],
      location: json['location'],
      title: json['title'],
      speakerImage: json['speaker_image'],
      speakerName: json['speaker_name'],
      sponsorName: json['sponsor_name'],
      rating: json['rating'].toDouble(),
      seatsAvailability: json['seats_availability'],
      sortingDate: json['sorting_date'],
    );
  }
}
