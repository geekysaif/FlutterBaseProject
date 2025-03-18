import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbaseproject/businessPresentation/eventUI/eventPage.dart';
import 'package:flutterbaseproject/businessPresentation/noDataUI/nodatafound.dart';
import 'package:flutterbaseproject/businessPresentation/productsUI/products.dart';
import 'package:flutterbaseproject/businessUtils/constants/constants.dart';
import 'package:flutterbaseproject/businessUtils/toast/ToastUtil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../businessLogic/blocs/profile_bloc/profile_bloc.dart';
import '../../businessUtils/appbar/custom_appbar.dart';
import '../../businessUtils/colors/colors.dart';
import '../../businessUtils/datePicker/date_picker_util.dart';
import '../../businessUtils/globalWidgets/global_widgets.dart';
import '../../businessUtils/permissionHandler/permission_handler.dart';
import 'dart:io';

import '../../businessUtils/shimmer/shimmer_loader.dart';
class Profile extends StatefulWidget {

  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String strName="";
  String selectedDate = "Birthday";
  String? strSelectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfile());
  }

  @override
  Widget build(BuildContext context) {
    // Get the height of the device
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: strName,
        showBackButton: true,
      ),
      body: SafeArea(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) async {
            if (state is ProfileSuccess) {
              log("state response:--- ${state.strUserEmail}");
              setState(() {
                strName = "${state.strUserFirstName ?? ''} ${state.strUserLastName ?? ''}";
              });
            }
          },
          builder: (context, state) {
            if (state is ProfileSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: deviceHeight * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: _showSourceSelectionDialog,
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipOval(
                                    child: strSelectedImage != null ?
                                    Image.file(
                                      File(strSelectedImage!), // Display the selected image
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ):
                                    Image.network(
                                      AppStrings.img3, // Replace with your image URL
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (context, widget, loadingProgress) {
                                        // If the image is loading, show a loading indicator
                                        if (loadingProgress == null) {
                                          return widget; // Return the image widget
                                        } else {
                                          // Image is still loading, show a loading indicator
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress.expectedTotalBytes != null
                                                  ? loadingProgress.cumulativeBytesLoaded /
                                                  (loadingProgress.expectedTotalBytes ?? 1)
                                                  : null
                                            ),
                                          );
                                        }
                                      },
                                    ),
                
                                       /* :  CachedNetworkImage(
                                      imageUrl: AppStrings.img3,
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => const SizedBox(
                                        height: 150.0,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => const Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          color: Colors.grey,
                                          size: 150,
                                        ),
                                      ),
                                    ),*/
                
                                  )),
                            ),
                          ),
                          Center(
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:  Text(
                                  strName,
                                  style: CustomStyle.subtitle1,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                            ),
                          ),
                          Center(
                            child: Text(
                              state.strUserEmail.toString(),
                              style: CustomStyle.bodyText1,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildProfileCard('assets/images/slider1.png', state.strUserGender.toString().toUpperCase(), () {
                                  // Handle tap event here, for example:
                                  print('Gender card tapped');
                                }),
                              Center(
                                child: GestureDetector(
                                  onTap: (){_pickDate();}, // The function to be called when the card is tapped
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      height: 60,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Image.asset('assets/images/slider2.png', width: 30, height: 30),
                                          ),
                                          Text(
                                            selectedDate,
                                            style: CustomStyle.bodyText2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                                buildProfileCard('assets/images/slider3.png', AppStrings.location, () {
                                  // Handle tap event here, for example:
                                  print('Location card tapped');
                                }),
                
                              ],),
                          ),
                
                        ],
                      ),
                    ),
                    Container(
                      height: deviceHeight * 0.6,
                       // Half screen height
                      child: DefaultTabController(
                        length: 2, // Number of tabs
                        child: Column(
                          children: [
                            TabBar(
                              indicatorColor: AppColors.primaryColor,
                              indicatorWeight: 4.0,
                              labelColor: AppColors.primaryColor,
                              unselectedLabelColor: AppColors.mediumGray,
                              tabs: [
                                Tab( text: "Products"),
                                Tab( text: "Events"),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  // Home Tab content
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Products(),
                                    ),
                                  ),
                                  // Favorites Tab content
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: EventsList(),
                                    ),
                                  ),
                                  // Settings Tab content
                
                                ],
                              ),
                            ),
                
                          ],
                        ),
                      ),
                    ),
                    // Content for the other half of the screen (optional)
                  ],
                ),
              );
            }
            else if(state is ProfileLoading){
              return ShimmerLoader(type: ShimmerType.profile);
            }
            else {
              return NoDataFoundWidget();
            }
          },
        ),
      ),
    );
  }


  // Helper method to build profile cards with click listener
  Widget buildProfileCard(String imagePath, String text, VoidCallback onTap) {
    return Center(
      child: GestureDetector(
        onTap: (){tapItems(text);}, // The function to be called when the card is tapped
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            height: 60,
            width: 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(imagePath, width: 30, height: 30),
                ),
                Text(
                  text,
                  style: CustomStyle.bodyText2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //tap items
  void tapItems(String text) {
    setState(() {
      if(text=='DOB'){
        _pickDate();
      }
    ToastUtil.showToast('${text} is clicked');
    });

  }

  // Function to show the dialog to select Camera or Gallery
  Future<void> _showSourceSelectionDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Camera"),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _onCameraClick();
                  // Pick image from camera

                },
              ),
              ListTile(
                title: Text("Gallery"),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _onGalleryClick();
            // Pick image from camera

                },
              )
            ],
          ),
        );
      },
    );
  }

  // Function to pick an image from the selected source
  Future<void> _pickImage(ImageSource source) async {
    bool cameraPermission = await PermissionHandler.checkCameraPermission();
    bool galleryPermission = await PermissionHandler.checkGalleryPermission();

    if (source == ImageSource.camera && cameraPermission) {
      // If camera permission is granted, open the camera
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          strSelectedImage=image.path ;
          print("Image picked from camera: ${strSelectedImage}");
          ToastUtil.showToast(AppStrings.cameraImageSelect);
        });

      }
    }
    else if (source == ImageSource.gallery && galleryPermission) {
      // If gallery permission is granted, open the gallery
     final XFile? image = await _picker.pickImage(source: source);
      // final XFile? image = await _picker.pickVideo(source: source);
      if (image != null) {
        setState(() {
          strSelectedImage=image.path;
          ToastUtil.showToast(AppStrings.galleryImageSelect);
          print("Image picked from gallery: ${strSelectedImage}");
        });
      }
    } else {
      // Handle permission denial
      print("Permission not granted for the selected source");
    }
  }

  /*open camera*/
  void _onCameraClick() async {
    bool cameraPermissionGranted = await PermissionHandler.checkCameraPermission();
    if (cameraPermissionGranted) {
      // Open the camera or do something
      _pickImage(ImageSource.camera);
    } else {
      // Permission was denied, or permanently denied
      // You can show a dialog explaining why the permission is required
      print("Camera permission denied");
    }
  }

  /*open photo*/
  void _onGalleryClick() async {
    bool galleryPermissionGranted = await PermissionHandler.checkGalleryPermission();
    if (galleryPermissionGranted) {
      // Open the gallery or do something
      _pickImage(ImageSource.gallery);
    } else {
      // Permission was denied, or permanently denied
      // You can show a dialog explaining why the permission is required
      print("Gallery permission denied");
    }
  }

  /*date picker*/
  Future<void> _pickDate() async {
    String? date = await DatePickerUtil.selectDate(context,disableFutureDates: true,disablePastDates: false); // Call the utility class
    if (date != null) {
      setState(() {
        selectedDate = date; // Update UI
      });
    }
  }

}
