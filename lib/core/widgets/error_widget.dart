import 'package:dreamsoft/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  const AppErrorWidget({required this.message, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 400.h,
          child: Lottie.asset("assets/lotties/error.json", fit: BoxFit.contain)
        ),
        SizedBox(
          width: 300.w,
          child: Text(
            message,
            style: TextStyles.textViewBlack25,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}