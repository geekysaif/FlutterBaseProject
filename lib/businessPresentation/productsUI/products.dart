import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbaseproject/businessLogic/blocs/products_bloc/products_bloc.dart';
import 'package:flutterbaseproject/businessUtils/appRouter/AppRouter.dart';
import 'package:flutterbaseproject/businessUtils/colors/colors.dart';
import 'package:flutterbaseproject/businessUtils/constants/constants.dart';
import 'package:flutterbaseproject/businessUtils/navigationService/NavigationService.dart';
import 'package:logging/logging.dart';
import '../../businessLogic/services/api_services/api_service.dart';
import '../../businessUtils/internet/ConnectivityService.dart';
import '../../businessUtils/share/share_helper.dart';
import '../../businessUtils/shimmer/shimmer_loader.dart';
import '../../businessUtils/toast/ToastUtil.dart';
import '../noDataUI/nodatafound.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
    return const MyHomePage(title: 'products');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConnectivityService connectivityService = ConnectivityService();
  // int? clickedItemIndex;
  // final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    hitProductsApi();
  }

  Future<void> navigateAndHitApi(BuildContext context, int index, var state) async {

    // Save the index of the clicked item
    //clickedItemIndex = index;

    // Navigate to the product detail screen and await the result
    final result = await NavigationService.navigateAndBackRefresh(
      AppRouter.productsDetail,
      arguments: state.response[index].id.toString(),
    );

    // If the result is true, refresh the list
    if (result == true) {
      hitProductsApi(); // Call your function to refresh the list
    }
  }



/*call products api*/
  Future<void> hitProductsApi() async {
    bool isConnected = await connectivityService.checkConnectivity();
    if (isConnected) {
      context.read<ProductsBloc>().add(GetProducts());


   /*   // Wait for the API to return the products (adjust timing or use a listener)
      await Future.delayed(Duration(seconds: 1)); // Adjust the delay based on your state management

      // After the API call, scroll to the clicked item
      if (clickedItemIndex != null) {
        double itemPosition = clickedItemIndex! * 80.0; // Adjust item height
        _scrollController.jumpTo(itemPosition);
      }*/



    } else {
      ToastUtil.showToast(AppStrings.noInternetMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) async {
        if (state is ProductsSuccess) {
          log("state response:--- ${state.response}");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                if (state is ProductsSuccess) ...[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                          key: PageStorageKey<String>('productsList'),
                          itemCount: state.response.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: InkWell(
                                splashColor: AppColors.primaryColor,
                                hoverColor: AppColors.red,
                                onTap: (){
                                  navigateAndHitApi(context, index, state);
                                  //NavigationService.navigateAndBackRefresh(AppRouter.productsDetail,  arguments:state.response[index].id.toString());
                                //  context.push('/productsDetails',extra: state.response[index].id.toString()).then((value) => hitProductsApi());
                                  // print('Item clicked: ${state.response[index].title}');
                                  // ToastUtil.showToast(state.response[index].title.toString());

                                },
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Card(
                                        elevation: 4,
                                        margin: EdgeInsets.all(12),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Share
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: InkWell(
                                                  onTap: (){
                                                    ShareHelper.shareText('Text 1: This is the first part.',state
                                                        .response[index]
                                                        .images![0]);
                                                  },
                                                  child: Container(
                                                    height: 30.0,
                                                    width: 30.0,
                                                    decoration: BoxDecoration(
                                                         color: AppColors.primaryColor.withOpacity(0.1), // Background color with opacity
                                                        shape: BoxShape.circle,
                                                      border: Border.all(color: AppColors.primaryColor,width: 2)
                                                        ),
                                                    child: Icon(Icons.share,
                                                        color: AppColors.primaryColor,
                                                        size: 20),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              // Product Image
                                              Center(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    imageUrl: state
                                                        .response[index]
                                                        .images![0],
                                                    height: 150,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                    placeholder: (context, url) =>
                                                        SizedBox(
                                                      height: 150.0,
                                                      child: Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Center(
                                                      child: Icon(
                                                        Icons.broken_image,
                                                        color: Colors.grey,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12),

                                              // Product Title and Price
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      state
                                                          .response[index].title!,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$${state.response[index].price}',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 6),

                                              // Category and Rating
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    state
                                                        .response[index].category!
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.star,
                                                          color: Colors.amber,
                                                          size: 16),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        state.response[index]
                                                            .rating
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 12),

                                              // Description
                                              Text(
                                                state
                                                    .response[index].description!,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black87),
                                              ),
                                              SizedBox(height: 12),

                                              // Tags
                                              Wrap(
                                                spacing: 8,
                                                children: state
                                                    .response[index].tags!
                                                    .map<Widget>((tag) => Chip(
                                                          label: Text(tag),
                                                          backgroundColor:
                                                              Colors.blue.shade50,
                                                        ))
                                                    .toList(),
                                              ),

                                              SizedBox(height: 12),

                                              // Stock and Availability
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Stock: ${state.response[index].stock}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.red),
                                                  ),
                                                  Text(
                                                    state.response[index]
                                                        .availabilityStatus!,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.orange),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            );
                          },
                        ),
                        /*ListWheelScrollView(
                          itemExtent: 50.0,
                          diameterRatio: 2.0,
                          perspective: 0.005,
                          onSelectedItemChanged: (index) {
                            print('Selected item: ${state.response[index]}');
                          },
                          children: state.response.map((item) {
                            return Container(
                              alignment: Alignment.center,
                              color: Colors.blue[100],
                              child: Text(
                                item.title.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                        ),*/

                      ),
                    ],
                  ),
                ],
                if (state is ProductsLoading) ...[
                  const Align(
                      alignment: Alignment.center,
                      child: ShimmerLoader(type: ShimmerType.list)
                  ),
                ],
                if (state is ProductsFail) ...[const NoDataFoundWidget()]
              ],
            ),
          ),
        );
      },
    );
  }
}
