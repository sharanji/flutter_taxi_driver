import 'package:driver_taxi_app/models/tabIcon_data.dart';
import 'package:driver_taxi_app/providers/dashboard.dart';
import 'package:driver_taxi_app/screens/new_bookings.dart/newbookings.dart';
import 'package:driver_taxi_app/screens/payment/choose_payment.dart';
import 'package:driver_taxi_app/screens/profile/components/profile_menu.dart';
import 'package:driver_taxi_app/screens/profile/profile_screen.dart';
import 'package:driver_taxi_app/screens/ride/ridescreen.dart';
import 'package:driver_taxi_app/screens/training/training_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../bottom_navigation_view/bottom_bar_view.dart';
import '../../fitness_app_theme.dart';
import '../../screens/my_diary/my_diary_screen.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    // tabBody = MyDiaryScreen(animationController: animationController);
    tabBody = TrainingScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[dashboardProvider.pageIndex].isSelected = true;
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  getTabBody(animationController, dashboardProvider),
                  bottomBar(dashboardProvider),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget getTabBody(animation, DashboardProvider provider) {
    switch (provider.pageIndex) {
      case 0:
        tabBody = TrainingScreen(animationController: animation);
        break;
      case 1:
        tabBody = NewBookingsScreen(animationController: animation);
        break;
      default:
        tabBody = ProfileScreen();
    }
    return tabBody;
  }

  Widget bottomBar(DashboardProvider provider) {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
            Navigator.of(context).pushNamed(RideScreen.routeName);
          },
          changeIndex: (int index) {
            provider.gotoPageIndex(index);
          },
        ),
      ],
    );
  }
}
