import 'package:flutter/material.dart';
import 'package:flutterbaseproject/businessUtils/colors/colors.dart';
import 'package:flutterbaseproject/businessUtils/fontFamily/font_family.dart';
import 'package:flutterbaseproject/businessUtils/navigationService/NavigationService.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showBackRefresh;
  final List<Widget>? actions;

    CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.showBackRefresh=false,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("showBackRefresh:---${showBackRefresh}");
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: AppColors.white, fontFamily: FontFamily.playFairDisplay),
      ),
      backgroundColor: AppColors.primaryColor,
      leading: showBackButton
          ? IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => NavigationService.goBackWithData(result: showBackRefresh),
      )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
