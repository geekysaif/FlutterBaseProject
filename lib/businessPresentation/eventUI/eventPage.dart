import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbaseproject/businessLogic/models/eventResponse/event_model.dart';
import 'package:flutterbaseproject/businessUtils/animations/BlinkAnimationUtil.dart';
import 'package:flutterbaseproject/businessUtils/appRouter/AppRouter.dart';
import 'package:flutterbaseproject/businessUtils/navigationService/NavigationService.dart';
import 'package:logging/logging.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:sizer/sizer.dart';
import '../../businessUtils/colors/colors.dart';
import '../../businessUtils/constants/constants.dart';
import '../../businessUtils/getDeviceType/device_utils.dart';
import '../../businessUtils/shimmer/shimmer_loader.dart';
import '../../businessUtils/toast/ToastUtil.dart';
import 'event_details_screen.dart';

class EventsList extends StatefulWidget {
  const EventsList({super.key});

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  setupLog() {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      log('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  @override
  void initState() {
    setupLog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: AppStrings.appName);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*for slider view*/
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> images = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];

  /*for filters*/
  final List<String> locationList = [
    'Conference Hall A, City Center',
    'Room 101, Tech Park',
    'Main Auditorium, Downtown',
  ];
  final List<String> trainingList = [
    'Cybersecurity Trends in 2025',
    'The Future of Space Exploration',
    'Green Technologies and Sustainability',
  ];
  final List<String> trainerList = [
    'Chloe Lee',
    'David Martin',
    'Lisa Williams',
  ];

  //  filter lists at the global level
  List<String> selectedLocations = [];
  List<String> selectedTrainingNames = [];
  List<String> selectedTrainers = [];

  TextEditingController searchController = TextEditingController();
  List<EventData> events = []; // Define outside FutureBuilder
  List<EventData> filteredEvents = []; // Define outside FutureBuilder
  bool isDataLoaded = false;
  bool isFilterApply = false;
  bool isLocationListVisible = true;
  bool isTrainingNameListVisible = false;
  bool isTrainersNameListVisible = false;

  //get data from asset json page
  Future<void> loadDataOnce() async {
    if (events.isEmpty || !isDataLoaded) {
      // Check if data is not loaded
      String jsonString = await rootBundle.loadString('assets/events.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      List<dynamic> eventsJson = jsonMap['events'];
      setState(() {
        events = eventsJson
            .map((eventJson) => EventData.fromJson(eventJson))
            .toList();
        // Sort events based on sortingDate in descending order
        // Sort events based on sortingDate in descending order
        events.sort((a, b) {
          DateTime dateA = DateTime.parse(
              a.sortingDate); // Parse the sortingDate to DateTime
          DateTime dateB = DateTime.parse(
              b.sortingDate); // Parse the sortingDate to DateTime
          return dateB.compareTo(dateA); // Compare in descending order
        });
        isDataLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadDataOnce();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  void _goToPreviousSlide() {
    if (_currentPage > 0) {
      _currentPage--;
    } else {
      _currentPage = images.length - 1;
    }
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  void _goToNextSlide() {
    if (_currentPage < images.length - 1) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  void _startAutoSlide() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (mounted) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: AppStrings.deviceType=='web'?2:4,
              child: Stack(
                //for overlap the ui
                children: [
                  Container(
                    height: AppStrings.deviceType=='web' ? 30.sp:40.sp,
                    decoration:
                        const BoxDecoration(color: AppColors.primaryColor),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Center everything
                              children: [
                                // Left Button (Always Visible)
                                GestureDetector(
                                  onTap: _goToPreviousSlide,
                                  child: Container(
                                    width: 40, // Fixed width for better layout
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    child: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
                                  ),
                                ),

                                // Spacer to avoid tight fit
                                const SizedBox(width: 10),

                                // Slider View (Centered)
                                Expanded( // Allows the slider to take the remaining space
                                  child: Container(
                                    height: AppStrings.deviceType=='web'?40.sp : 50.sp,
                                    child: PageView.builder(
                                      controller: _pageController,
                                      itemCount: images.length,
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentPage = index;
                                        });
                                      },
                                      itemBuilder: (context, index) {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            images[index],
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),

                                // Spacer for better button positioning
                                const SizedBox(width: 10),

                                // Right Button (Always Visible)
                                GestureDetector(
                                  onTap: _goToNextSlide,
                                  child: Container(
                                    width: 40, // Fixed width
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    child: const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.mediumGray, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        _showFilterDialog();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.sort),
                          Text(AppStrings.filter),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // ListView inside a Column
            // Display the events once data is loaded
            isDataLoaded
                ? Expanded(
                    flex: AppStrings.deviceType== 'web'? 3:9,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height -
                          350, // Adjust as needed
                      child: ListView.builder(
                        itemCount: isFilterApply
                            ? filteredEvents.length
                            : events.length,
                        itemBuilder: (context, index) {
                          final event = isFilterApply
                              ? filteredEvents[index]
                              : events[index];
                          return InkWell(
                            splashColor: AppColors.primaryColor,
                            onTap: () {
                              NavigationService.navigateTo(
                                  AppRouter.eventDetail,
                                  arguments: event);
                              //context.push('/eventDetail', extra: event);
                              //   context.push('/webViews?url=${Uri.encodeComponent(AppStrings.webviewUrl)}');
                              /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventDetailsScreen(
                                      event:
                                          event), // Pass event object to the details screen
                                ),
                              );*/
                            },
                            child: Card(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: SizedBox(
                                height: 160,
                                width: 150,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              event.date,
                                              maxLines: 2,
                                              // Limit to 2 lines
                                              overflow: TextOverflow.fade,
                                              // Fade the text if it overflows
                                              softWrap: true,
                                              // Add ellipsis if text overflows
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              event.timeDurations,
                                              maxLines: 2,
                                              // Limit to 2 lines
                                              overflow: TextOverflow.fade,
                                              // Fade the text if it overflows
                                              softWrap: true,
                                              // Add ellipsis if text overflows
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                event.location,
                                                maxLines: 2,
                                                // Limit to 2 lines
                                                overflow: TextOverflow.fade,
                                                // Fade the text if it overflows
                                                softWrap: true,
                                                // Add ellipsis if text overflows
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          right: 9.0, left: 9.0),
                                      child: DottedLine(
                                        direction: Axis.vertical,
                                        // Horizontal dotted line
                                        lineLength: double.infinity,
                                        // Line spans the whole width
                                        lineThickness: 1.0,
                                        // Line thickness
                                        dashLength: 8.0,
                                        // Length of each dash
                                        dashColor: Colors.black,
                                        // Color of each dash
                                        dashGapLength: 4.0,
                                        // Gap between the dashes
                                        dashGapColor: Colors
                                            .transparent, // Color of the gap
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: BlinkAnimation(
                                                  child: Text(
                                                      event.seatsAvailability,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .red)),
                                                )),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${event.title}(${event.rating})',
                                              maxLines: 2,
                                              // Limit to 2 lines
                                              overflow: TextOverflow.fade,
                                              // Fade the text if it overflows
                                              softWrap: true,
                                              // Add ellipsis if text overflows
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight
                                                      .w900), // You can style it as needed
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      height: 30.0,
                                                      // Set equal height and width for a circle
                                                      width: 30.0,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        // Circle shape
                                                        border: Border.all(
                                                            color:
                                                                AppColors.white,
                                                            width:
                                                                1), // Optional border
                                                      ),
                                                      child: ClipOval(
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: AppStrings
                                                              .demoImageUrl,
                                                          fit: BoxFit.cover,
                                                          // Ensure the image is correctly scaled inside the circle
                                                          placeholder: (context,
                                                                  url) =>
                                                              const SizedBox(
                                                            height: 150.0,
                                                            child: Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            ),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .broken_image,
                                                              color:
                                                                  Colors.grey,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 15,
                                                      top: 16,
                                                      child: Container(
                                                        height: 15.0,
                                                        // Set equal height and width for a circle
                                                        width: 15.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          // Circle shape
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .white,
                                                              width:
                                                                  1), // Optional border
                                                        ),
                                                        child: ClipOval(
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: AppStrings
                                                                .demoImageUrl2,
                                                            fit: BoxFit.cover,
                                                            // Ensure the image is correctly scaled inside the circle
                                                            placeholder: (context,
                                                                    url) =>
                                                                const SizedBox(
                                                              height: 150.0,
                                                              child: Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              ),
                                                            ),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                const Center(
                                                              child: Icon(
                                                                Icons
                                                                    .broken_image,
                                                                color:
                                                                    Colors.grey,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      event.speakerName,
                                                      maxLines: 2,
                                                      // Limit to 2 lines
                                                      overflow:
                                                          TextOverflow.fade,
                                                      // Fade the text if it overflows
                                                      softWrap: true,
                                                      // Add ellipsis if text overflows
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .w900), // You can style it as needed
                                                    ),
                                                    Text(
                                                      event.sponsorName,
                                                      maxLines: 2,
                                                      // Limit to 2 lines
                                                      overflow:
                                                          TextOverflow.fade,
                                                      // Fade the text if it overflows
                                                      softWrap: true,
                                                      // Add ellipsis if text overflows
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .normal), // You can style it as needed
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      minimumSize:
                                                          MaterialStateProperty
                                                              .all(const Size(
                                                                  50, 30)),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(AppColors
                                                                  .primaryColor),
                                                      // Background color
                                                      shape:
                                                          MaterialStateProperty
                                                              .all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  5.0), // Customize the border radius
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      ToastUtil.showToast(
                                                          AppStrings
                                                              .enrollSuccess);
                                                    },
                                                    child: const Text(
                                                      AppStrings.enroll,
                                                      style: TextStyle(
                                                          fontSize: 10.0,
                                                          color: Colors.white),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : const Center(child:  ShimmerLoader(type: ShimmerType.list)),
            // Show loading indicator if data isn't loaded
          ],
        ),
      ),
    );
  }

// Show the filter dialog
  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.lightGray,
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setDialogState) {
            child:
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.filterEvents,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          color: AppColors.darkGray,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const Divider(
                    color: AppColors.darkGray, // Set line color
                    thickness: 1.0, // Set line thickness
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: AppColors.darkGray),
                              child: const Center(
                                child: Text(
                                  AppStrings.sortBy,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors
                                        .white, // Use primary color for emphasis
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        flex: 6,
                        child: Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.darkGray,
                                  // Outline border color
                                  width: 2.0, // Border width
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(2)),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter text here',
                                    // Hint text
                                    hintStyle:
                                        TextStyle(color: AppColors.black),
                                    // Remove default border
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors
                                        .black, // Use primary color for emphasis
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Material(
                          color: AppColors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: InkWell(
                                  onTap: () {
                                    setDialogState(() {
                                      isLocationListVisible = true;
                                      isTrainingNameListVisible = false;
                                      isTrainersNameListVisible = false;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: isLocationListVisible
                                          ? AppColors.red
                                          : AppColors
                                              .darkGray, // Change color when visible
                                    ),
                                    child: const Center(
                                      child: Text(
                                        AppStrings.location,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors
                                              .white, // Use primary color for emphasis
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    setDialogState(() {
                                      isLocationListVisible = false;
                                      isTrainingNameListVisible = true;
                                      isTrainersNameListVisible = false;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: isTrainingNameListVisible
                                          ? AppColors.red
                                          : AppColors
                                              .darkGray, // Change color when visible
                                    ),
                                    child: const Center(
                                      child: Text(
                                        AppStrings.trainingName,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors
                                              .white, // Use primary color for emphasis
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    setDialogState(() {
                                      isLocationListVisible = false;
                                      isTrainingNameListVisible = false;
                                      isTrainersNameListVisible = true;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: isTrainersNameListVisible
                                          ? AppColors.red
                                          : AppColors.darkGray,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        AppStrings.trainer,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors
                                              .white, // Use primary color for emphasis
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        flex: 6,
                        child: // Location checkboxes
                            Column(
                          children: [
                            Visibility(
                                visible: isLocationListVisible,
                                child: _buildCheckboxLocationList(
                                    'Locations', locationList)),
                            Visibility(
                                visible: isTrainingNameListVisible,
                                child: _buildCheckboxTrainingNameList(
                                    'Training Names', trainingList)),
                            Visibility(
                                visible: isTrainersNameListVisible,
                                child: _buildCheckboxTrainerList(
                                    'Trainers', trainerList)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  selectedLocations.isEmpty &&
                          selectedTrainingNames.isEmpty &&
                          selectedTrainers.isEmpty
                      ? ToastUtil.showToast(AppStrings.selectCheckBoxMsg)
                      : _applyFilters(); // Apply filters when button is pressed
                });
              },
              child: const Text(
                AppStrings.applyFilters,
                style: TextStyle(color: AppColors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  resetFilters();
                });
              },
              child: const Text(AppStrings.resetFilters,
                  style: TextStyle(color: AppColors.red)),
            ),
          ],
        );
      },
    );
  }

  // Checkbox list location
  Widget _buildCheckboxLocationList(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...options.map((option) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return CheckboxListTile(
                title: Text(
                  option,
                  style: const TextStyle(fontSize: 10),
                ),
                value: selectedLocations.contains(option),
                // Checkbox checked state
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedLocations.add(option); // Add to set if checked
                    } else {
                      selectedLocations
                          .remove(option); // Remove from set if unchecked
                    }
                  });
                },
              );
            },
          );
        }),
      ],
    );
  }

  // Checkbox list training name
  Widget _buildCheckboxTrainingNameList(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...options.map((option) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return CheckboxListTile(
                title: Text(option),
                value: selectedTrainingNames.contains(option),
                // Checkbox checked state
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedTrainingNames
                          .add(option); // Add to set if checked
                    } else {
                      selectedTrainingNames
                          .remove(option); // Remove from set if unchecked
                    }
                  });
                  // _applyFilters();
                },
              );
            },
          );
        }),
      ],
    );
  }

  // Checkbox list trainer
  Widget _buildCheckboxTrainerList(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...options.map((option) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return CheckboxListTile(
                title: Text(option),
                value: selectedTrainers.contains(option),
                // Checkbox checked state
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedTrainers.add(option); // Add to set if checked
                    } else {
                      selectedTrainers
                          .remove(option); // Remove from set if unchecked
                    }
                  });
                  //_applyFilters();
                },
              );
            },
          );
        }),
      ],
    );
  }

// Apply the filters
  void _applyFilters() {
    filteredEvents.clear();
    isFilterApply = true;
    setState(() {


      if (selectedLocations.isEmpty &&
          selectedTrainingNames.isEmpty &&
          selectedTrainers.isEmpty) {
        // If all filters are empty, show all events without filtering
        filteredEvents = List.from(events);
      } else {
        for (var event in events) {
          bool matchesAnyFilter = false;

          // Check if event matches any selected location
          if (selectedLocations.isNotEmpty &&
              selectedLocations.any((loc) => event.location.contains(loc))) {
            matchesAnyFilter = true;
          }

          // Check if event matches any selected training name
          if (selectedTrainingNames.isNotEmpty &&
              selectedTrainingNames.any((name) => event.title.contains(name))) {
            matchesAnyFilter = true;
          }

          // Check if event matches any selected trainer
          if (selectedTrainers.isNotEmpty &&
              selectedTrainers
                  .any((trainer) => event.speakerName.contains(trainer))) {
            matchesAnyFilter = true;
          }

          // Add event to filteredEvents if it matches any filter and is not already added
          if (matchesAnyFilter && !filteredEvents.contains(event)) {
            filteredEvents.add(event);
          }
        }
      }
    });
    Navigator.of(context).pop();
  }

// Reset the filters
  void resetFilters() {
    setState(() {
      isFilterApply = false;
      filteredEvents.clear();
      selectedLocations.clear();
      selectedTrainingNames.clear();
      selectedTrainers.clear();
      isDataLoaded = false; // Reset data load state to trigger data reload
      Navigator.of(context).pop();
    });
    loadDataOnce(); // Reload the data once filters are reset
  }

}
