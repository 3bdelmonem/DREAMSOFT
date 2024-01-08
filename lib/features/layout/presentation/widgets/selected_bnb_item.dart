import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedBnbItem extends StatelessWidget {
  final String icon;
  final String label;
  const SelectedBnbItem({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {

    return IntrinsicWidth(
      child: AnimatedContainer(
        height: 30.h,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: extraLightGrey,
          borderRadius: BorderRadius.circular(30.r)
        ),
        child: Row(
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: black,
                shape: BoxShape.circle
              ),
              child: SvgPicture.asset(
                icon,
                colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                width: 14.w,
                height: 14.h,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, end: 20),
              child: Text(
                label,
                style: TextStyles.textViewExtraBold11,
              ),
            )
          ],
        ),
      ),
    );
  }
}