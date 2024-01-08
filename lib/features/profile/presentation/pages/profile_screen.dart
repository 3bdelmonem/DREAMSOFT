import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250.w,
              child: LottieBuilder.asset("assets/lotties/profile.json", fit: BoxFit.contain,)
            ),
            SizedBox(
              width: 325.w,
              child: Text("There is no information at the moment.", style: TextStyles.textViewBlack25, textAlign: TextAlign.center)
            ),
          ],
        ),
      ),
    );
  }
}