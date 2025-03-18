import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbaseproject/businessUtils/appRouter/AppRouter.dart';
import 'package:flutterbaseproject/businessUtils/colors/colors.dart';
import 'package:flutterbaseproject/businessUtils/navigationService/NavigationService.dart';
import 'package:logging/logging.dart';
import '../model/IntroSliderModel.dart';

class IntroSlider extends StatefulWidget {
  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  PageController pageController = PageController();
  int currentIndex = 0;

  /*list of images*/
  final List<IntroSliderModel> introSlides = [
    IntroSliderModel(
        imagePath: "assets/images/slider1.png",
        title: "Welcome to Yoga Day",
        description:
            "Embrace wellness and harmony through guided yoga sessions."),
    IntroSliderModel(
        imagePath: "assets/images/slider2.png",
        title: "Relax and Rejuvenate",
        description:
            "Discover calming yoga routines to reduce stress and improve focus."),
    IntroSliderModel(
        imagePath: "assets/images/slider3.png",
        title: "Improve Flexibility",
        description:
            "Daily stretches designed to enhance your body’s flexibility."),
    IntroSliderModel(
        imagePath: "assets/images/slider4.png",
        title: "Boost Your Strength",
        description: "Strengthen your body with power yoga sessions."),
    IntroSliderModel(
        imagePath: "assets/images/slider5.png",
        title: "Live a Balanced Life",
        description:
            "Incorporate yoga into your daily routine for a healthier lifestyle.")
  ];

  @override
  void initState() {
    setupLog();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: introSlides.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            introSlides[index].imagePath,
                            height: screenHeight * 0.7, // Scales image height
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Text(
                            introSlides[index].title,
                            style: TextStyle(
                              color: AppColors.darkGreen,
                              fontSize: 22, // Responsive font size
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            introSlides[index].description,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ));
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              introSlides.length,
                  (index) => GestureDetector(
                onTap: () {
                   pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: buildDot(index, context),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: ElevatedButton(
              onPressed: currentIndex == introSlides.length - 1
                  ? () {
               // Navigator.pushReplacementNamed(context, '/login');
               // context.go('/login');
                NavigationService.navigateAndReplace(AppRouter.login);
              }
                  : () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Text(
                currentIndex == introSlides.length - 1 ? 'Get Started' : 'Next',
                style: TextStyle(fontSize: screenWidth * 0.045,color: AppColors.primaryColor),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );


  }

  /*slider dots*/
  Widget buildDot(int index, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenWidth * 0.02,
      width: currentIndex == index ? screenWidth * 0.04 : screenWidth * 0.02,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.01),
        color: currentIndex == index ? AppColors.primaryColor : Colors.grey,
      ),
    );
  }


  /*log printer*/
  setupLog() {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      log('${record.level.name}: ${record.time}: ${record.message}');
    });
  }
}
