import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbaseproject/businessLogic/blocs/login_bloc/login_bloc.dart';
import 'package:flutterbaseproject/businessLogic/blocs/products_bloc/products_bloc.dart';
import 'package:flutterbaseproject/businessUtils/colors/colors.dart';
import 'package:logging/logging.dart';

import '../../businessLogic/blocs/product_details/product_details_bloc.dart';
import '../../businessLogic/services/api_services/api_service.dart';
import '../../businessUtils/appbar/custom_appbar.dart';
import '../../businessUtils/constants/constants.dart';
import '../../businessUtils/navigationService/NavigationService.dart';
import '../../businessUtils/shimmer/shimmer_loader.dart';
import '../noDataUI/nodatafound.dart';

class ProductsDetails extends StatefulWidget {
  final String strProductId;
  const ProductsDetails({super.key, required this.strProductId});
  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
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
    hitProductDetailsApi();
  }

  /*call productDetail api*/
  Future<void> hitProductDetailsApi() async {
    context.read<ProductDetailsBloc>().add(GetProductsDetail(widget.strProductId));
  }

  // Override onWillPop to handle the back button press
  Future<bool> onWillPop() async {
    // Call goBack from NavigationService
    // In the screen you're navigating back from
    NavigationService.goBackWithData(result: true);
    return true; // Return true to allow the back navigation
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
          listener: (context, state) async {
        if (state is ProductDetailsSuccess) {
          log("state response:--- ${state.response}");
        }

      }, builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBar(
              title: AppStrings.productsDetail,
              showBackButton: true,
              showBackRefresh: true,
            ),
            body: SafeArea(
                child: Stack(
                    children: [
                      if (state is ProductDetailsSuccess) ...[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  // Product Image
                                  Center(
                                    child: CachedNetworkImage(
                                      imageUrl: state
                                          .response.thumbnail.toString(),
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
                                  SizedBox(height: 10),

                                  // Product Title and Price
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          state.response.title!,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '\$${state.response.price}',
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
                                            .response.category!
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
                                            state.response
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
                                        .response.description!,
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
                                        .response.productTags!
                                        .map<Widget>((tag) => Chip(
                                      label: Text(tag,style: TextStyle(color: AppColors.white),),
                                      backgroundColor:
                                      AppColors.primaryColor,
                                    ))
                                        .toList(),
                                  ),

                                  SizedBox(height: 12),

                                ],
                              ),
                            )
                      ],
                      if (state is ProductDetailsLoading) ...[
                        const Align(
                            alignment: Alignment.center,
                            child: ShimmerLoader(type: ShimmerType.details)
                        ),
                      ],
                      if (state is ProductDetailsFail) ...[const NoDataFoundWidget()]
                    ])


            ));
      }),
    );
  }
}
