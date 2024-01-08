import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 200.w,
      height: 200.h,
      child: Center(
        child: Lottie.asset("assets/lotties/loading.json", fit: BoxFit.contain)
      )
    );
  }
}