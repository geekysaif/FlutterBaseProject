import 'package:flutter/material.dart';

import '../../businessUtils/colors/colors.dart';

class NoDataFoundWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const NoDataFoundWidget({
    Key? key,
    this.message = 'No Data Found',
    this.icon = Icons.search_off,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                  Border.all(color: AppColors.darkGreen)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: const Image(
                  alignment: Alignment.center,
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage('assets/images/logo.png'),
                  //  image: NetworkImage('https://picsum.photos/200'),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            message,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
