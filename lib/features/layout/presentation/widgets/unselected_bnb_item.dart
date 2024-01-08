import 'package:dreamsoft/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UnSelectedBnbItem extends StatelessWidget {
  final String icon;
  const UnSelectedBnbItem({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 20.w,
      height: 20.h,
      duration: const Duration(milliseconds: 300),
      child: SvgPicture.asset(
        icon,
        colorFilter: const ColorFilter.mode(black, BlendMode.srcIn),
        width: 16.w,
        height: 16.h,
      ),
    );
  }
}