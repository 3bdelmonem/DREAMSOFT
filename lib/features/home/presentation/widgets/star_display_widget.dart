import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/core/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class StarDisplayWidget extends StatelessWidget {
  final int value;
  const StarDisplayWidget({required this.value, super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(5, (index) {
          return SvgPicture.asset(
            starIcon,
            colorFilter: ColorFilter.mode( index < value ? gold : gold.withOpacity(0.25), BlendMode.srcIn),
            width: 12.w,
          );
        }),
      ),
    );
  }
}