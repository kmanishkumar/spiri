import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sized_context/sized_context.dart';

class FindLoveImageLoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: SizedBox(
        width: context.widthPx / 2.3,
        height: context.heightPx / 4.5,
        child: Card(
          // shape:
          //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          shape: CircleBorder(

          ),
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          elevation: 0,
        ),
      ),
    );
  }
}
