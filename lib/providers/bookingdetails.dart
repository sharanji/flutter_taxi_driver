import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:driver_taxi_app/models/bookingdetails.dart';

class BookingDetailsProvider with ChangeNotifier {
  BookingDetails bookingDetails = BookingDetails(
    rideDate: DateTime.now(),
    rideTime: TimeOfDay.now(),
  );
  void setridenowTrue() {
    bookingDetails.rideNow = true;
    notifyListeners();
  }

  void setridenowFalse() {
    bookingDetails.rideNow = false;
    notifyListeners();
  }
}
