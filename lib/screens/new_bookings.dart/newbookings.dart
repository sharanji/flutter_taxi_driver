import 'package:driver_taxi_app/constants.dart';
import 'package:driver_taxi_app/fitness_app_theme.dart';
import 'package:driver_taxi_app/main.dart';
import 'package:driver_taxi_app/screens/new_bookings.dart/bookingloading.dart';
import 'package:driver_taxi_app/theme.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class NewBookingsScreen extends StatefulWidget {
  const NewBookingsScreen({Key? key, this.animationController})
      : super(key: key);
  static const routeName = '/new-bookings';
  final AnimationController? animationController;

  @override
  State<NewBookingsScreen> createState() => _NewBookingsScreenState();
}

class _NewBookingsScreenState extends State<NewBookingsScreen> {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget bookingWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              // backgroundColor: kPrimaryColor,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: const Text(
              'Ram ( Aug 15 10:30 PM )',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            isThreeLine: true,
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Chip(
                  label: Text(
                    'Cash',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                const SizedBox(width: 10),
                Chip(
                  label: Text(
                    'Discount',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
            trailing: Text(
              '23.45 Kms',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 40, right: 15),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: const Text('Address 1 ahsgdvfahsdgvfajkdsb '),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: const Text('Address 1 ahsgdvfahsdgvfajkdsb '),
                        ),
                      ],
                    ),
                  ],
                ),
                // Text('2-3'),
              ],
            ),
          ),
          Container(
            // Confrim button
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.of(context).pop();
                  },
                  child: Container(
                    height: kToolbarHeight - 20,
                    padding: const EdgeInsets.symmetric(
                      // vertical: 5,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Ignore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const BookingConfrimed(),
                      //   ),
                      // );
                    },
                    child: Container(
                      height: kToolbarHeight - 20,
                      padding: const EdgeInsets.symmetric(
                        // vertical: 5,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            FitnessAppTheme.nearlyDarkBlue,
                            HexColor("#6F56E8")
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Accept',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(seconds: 5));
    return true;
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          // return BookingLoading();
          return const BookingLoading();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: 30,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return bookingWidget();
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: FitnessAppTheme.grey
                                  .withOpacity(0.4 * topBarOpacity),
                              offset: const Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 16 - 8.0 * topBarOpacity,
                                bottom: 12 - 8.0 * topBarOpacity),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // const Center(
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(8.0),
                                //     // child: Text(
                                //     //   'Training',
                                //     //   textAlign: TextAlign.left,
                                //     //   style: TextStyle(
                                //     //     fontFamily: FitnessAppTheme.fontName,
                                //     //     fontWeight: FontWeight.w700,
                                //     //     fontSize: 22 + 6 - 6 * topBarOpacity,
                                //     //     letterSpacing: 1.2,
                                //     //     color: FitnessAppTheme.darkerText,
                                //     //   ),
                                //     // ),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 38,
                                  width: 38,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      'New Bookings',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    bottom: 5,
                                  ),
                                  // width: MediaQuery.of(context).size.width / 2,
                                  // child: CustomSwitc(
                                  //   activeColor: kPrimaryColor,
                                  //   value: acceptingStatus,
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       acceptingStatus = value;
                                  //     });
                                  //   },
                                  // ),
                                ),

                                // SizedBox(
                                //   height: 38,
                                //   width: 38,
                                //   child: InkWell(
                                //     highlightColor: Colors.transparent,
                                //     borderRadius: const BorderRadius.all(
                                //         Radius.circular(32.0)),
                                //     onTap: () {},
                                //     child: Center(
                                //       child: Icon(
                                //         Icons.keyboard_arrow_right,
                                //         color: FitnessAppTheme.grey,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
