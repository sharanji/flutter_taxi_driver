import 'package:driver_taxi_app/providers/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:driver_taxi_app/providers/bookingdetails.dart';
import 'package:driver_taxi_app/providers/userdetails.dart';
import 'package:driver_taxi_app/routes.dart';
import 'package:driver_taxi_app/providers/googlemap.dart';
import 'package:driver_taxi_app/screens/dashboard/dashboardscreen.dart';
import 'package:driver_taxi_app/screens/dashboard/new_dashboard.dart';
import 'package:driver_taxi_app/screens/payment/booking_confimed.dart';
import 'package:driver_taxi_app/screens/payment/choose_payment.dart';
import 'package:driver_taxi_app/screens/splash_shop/components/splash_content.dart';
import 'package:driver_taxi_app/theme.dart';

import 'package:provider/provider.dart';

import './screens/splash_shop/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GoogleMapProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserDetailsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Taxi App',
        theme: theme(),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: NavigationHomeScreen(),
        routes: routes,
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
