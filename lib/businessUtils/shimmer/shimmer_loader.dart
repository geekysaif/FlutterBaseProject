import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum ShimmerType { list, grid, profile, details }

class ShimmerLoader extends StatelessWidget {
  final ShimmerType type;
  final int itemCount;

  const ShimmerLoader({Key? key, required this.type, this.itemCount = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ShimmerType.list:
        return _buildListShimmer();
      case ShimmerType.grid:
        return _buildGridShimmer();
      case ShimmerType.profile:
        return _buildProfileShimmer();
      case ShimmerType.details:
        return _buildDetailsShimmer();
      default:
        return _buildListShimmer();
    }
  }

  // 1. List Shimmer (For List Screens)
  Widget _buildListShimmer() {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 2. Grid Shimmer (For Grid Screens)
  Widget _buildGridShimmer() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: itemCount,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }

  // 3. Profile Shimmer (For Profile Screens)
  Widget _buildProfileShimmer() {
    return Center(
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 150,
              height: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // 4. Details Shimmer (For Details Screens)
  Widget _buildDetailsShimmer() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            height: 200,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 16, width: double.infinity, color: Colors.white),
                const SizedBox(height: 8),
                Container(height: 16, width: 200, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
