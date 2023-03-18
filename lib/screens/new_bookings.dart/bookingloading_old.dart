import 'package:flutter/material.dart';

class BookingLoading extends StatefulWidget {
  const BookingLoading({Key? key}) : super(key: key);

  @override
  State<BookingLoading> createState() => _BookingLoadingState();
}

class _BookingLoadingState extends State<BookingLoading> {
  List<Color> colorList = [Colors.grey, Colors.white, Colors.grey];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

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
        return AnimatedGradient();
      },
    );
  }
}

class AnimatedGradient extends StatefulWidget {
  @override
  _AnimatedGradientState createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient> {
  List<Color> colorList = [Colors.grey, Colors.white, Colors.grey];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.grey;
  Color topColor = Colors.white;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
            begin: begin, end: end, colors: [bottomColor, topColor]),
        borderRadius: BorderRadius.circular(20),
      ),
      duration: Duration(seconds: 2),
      onEnd: () {
        setState(() {
          index = index + 1;
          // animate the color
          bottomColor = colorList[index % colorList.length];
          topColor = colorList[(index + 1) % colorList.length];

          //// animate the alignment
          // begin = alignmentList[index % alignmentList.length];
          // end = alignmentList[(index + 2) % alignmentList.length];
        });
      },
    );
  }
}
