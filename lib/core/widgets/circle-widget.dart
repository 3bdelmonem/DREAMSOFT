// ignore_for_file: file_names
import 'package:dreamsoft/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CircleWidget extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  final Color color;
  final double size;
  final bool shadow;
  const CircleWidget({this.size = 40, this.shadow = false, this.color = black, required this.onTap, required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.w,
        height: size.h,
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: shadow ?
          [
            BoxShadow(
              offset:  const Offset(0, 3),
              blurRadius: 17,
              color: black.withOpacity(0.13),
            )
          ]:const []
        ),
        child: child,
      ),
    );
  }
}