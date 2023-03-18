import 'package:flutter/material.dart';
import 'package:driver_taxi_app/screens/sign_up/sign_up_screen.dart';
import 'package:driver_taxi_app/theme.dart';
import '../../../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your UserId and  Password are same as Provided by your HUB Manager or HUB Incharge",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(13),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Text(
          "Don’t have an account?",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        Text(
          "Try Contacting your HUB Manager",
          style: TextStyle(fontSize: getProportionateScreenWidth(13)),
        ),

        // GestureDetector(
        //   onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
        //   child: Text(
        //     "Sign Up",
        //     style: TextStyle(
        //       fontSize: getProportionateScreenWidth(16),
        //       color: kPrimaryColor,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
