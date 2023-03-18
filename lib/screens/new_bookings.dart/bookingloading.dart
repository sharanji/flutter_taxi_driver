import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookingLoading extends StatelessWidget {
  const BookingLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // controller: scrollController,
      padding: EdgeInsets.only(
        top: AppBar().preferredSize.height +
            MediaQuery.of(context).padding.top +
            24,
        bottom: 62 + MediaQuery.of(context).padding.bottom,
      ),
      itemCount: 2,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        // widget.animationController?.forward();
        return SizedBox(
          height: 250.0,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.2),
            highlightColor: Colors.grey.withOpacity(0.3),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        );
      },
    );
  }
}
