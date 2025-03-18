import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbaseproject/businessLogic/blocs/login_bloc/login_bloc.dart';
import 'package:flutterbaseproject/businessPresentation/eventUI/eventPage.dart';
import 'package:flutterbaseproject/businessPresentation/productsUI/products.dart';
import 'package:flutterbaseproject/businessUtils/colors/colors.dart';
import 'package:flutterbaseproject/businessUtils/constants/constants.dart';
import 'package:flutterbaseproject/businessUtils/navigationService/NavigationService.dart';
import 'package:logging/logging.dart';
import '../../businessLogic/services/api_services/api_service.dart';
import '../../businessUtils/appRouter/AppRouter.dart';
import '../../businessUtils/dialog/dialog_helper.dart';
import '../../businessUtils/fontFamily/font_family.dart';
import '../../businessUtils/fontSize/font_sizes.dart';
import '../../businessUtils/internet/ConnectivityService.dart';
import '../../businessUtils/toast/ToastUtil.dart';
import '../../businessUtils/webviewUI/webviewpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // This widget is the root of your application.
  final apiService = ApiService.create();

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
    return MyHomePage(title: 'Home');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String loginToken = "";

  ConnectivityService connectivityService = ConnectivityService();
  int _selectedIndex = 0; // Track selected bottom nav item
  final List<Widget> _pages = [
    const Center(child: Products()),
    const Center(child: EventsList()),
    // const Center(child: DemoApp()),
    Center(
      child:  WebViewPage(
        url: AppStrings.webviewUrl,
        onPageLoadedCallback: (loadedUrl) {
          print('WebView page loaded: $loadedUrl');
        },
      ),
    ),
  ];
  final List<String> _titles = [
    AppStrings.products,
    AppStrings.events,
    AppStrings.website
  ]; // Titles for each tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFabPressed() {
    // Action when the FAB is pressed
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Floating Action Button Pressed'),
    ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkGreen,
        iconTheme: IconThemeData(
          color: Colors.white, // Change this to your desired color
        ),
        title: Text(
          _titles[_selectedIndex],
          style: TextStyle(
              color: AppColors.white,
              fontSize: FontSizes.font22,
              fontFamily: FontFamily.playFairDisplay,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is Logout) {
                NavigationService.navigateAndReplace(AppRouter.login);
                ToastUtil.showToast(AppStrings.logoutSuccess);
              }
            },
            child: IconButton(
              icon: const Icon(
                Icons.outbond,
                color: AppColors.white,
              ),
              onPressed: () async {
                bool? result = await DialogHelper.showGlobalDialog(
                    context: context,
                    title: AppStrings.logout,
                    content: AppStrings.logoutMessage,
                    cancelText: AppStrings.cancel,
                    confirmText: AppStrings.logout);

                if (result != null && result) {
                  // Perform delete action
                  context.read<LoginBloc>().add(CallLogout());
                  // Navigator.pushReplacementNamed(context, '/login');
                } else {
                  // User canceled the dialog
                  print('Delete action canceled');
                }
              },
            ),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.mediumGray,
        // Active icon color
        unselectedItemColor: AppColors.white,
        // Inactive icon color
        selectedLabelStyle: const TextStyle(
            fontSize: FontSizes.font14,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.playFairDisplay),
        // Active label style
        unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontFamily: FontFamily.playFairDisplay),
        // Inactive label style
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: AppStrings.products,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: AppStrings.events,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: AppStrings.website,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
        // The icon for the FAB
        backgroundColor: Colors.green,
        // FAB background color
        shape: const CircleBorder(),
        // Make the FAB a full circle
        elevation: 6.0, // Adds shadow for the floating effect
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // Position of the FAB
    );
  }

  Widget _buildDrawer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Animation duration
      curve: Curves.slowMiddle, // Animation curve
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.darkGreen,
              ),
              child: const Text(
                AppStrings.appName,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.password),
              title: const Text(AppStrings.changePassword),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  ToastUtil.showToast(AppStrings.changePassword);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(AppStrings.profile),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  NavigationService.navigateTo(AppRouter.profile);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text(AppStrings.privacyPolicy),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  ToastUtil.showToast(AppStrings.privacyPolicy);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
