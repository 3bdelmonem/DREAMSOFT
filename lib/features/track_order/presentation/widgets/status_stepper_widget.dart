import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/util/colors.dart';
import '../../domain/entities/status_entity.dart';

class StatusStepperWidget extends StatelessWidget {
  final bool isBottom;
  final StatusEntity status;
  const StatusStepperWidget(
      {super.key, required this.isBottom, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(status.date, style: TextStyles.textViewBold16),
            Text(status.time, style: TextStyles.textViewBold11.copyWith(color: grey)),
          ],
        ),
        Column(
          children: [
            Container(
              width: 10.w,
              height: 10.w,
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: black,
              ),
            ),
            if (!isBottom)
            Container(
              width: 3.w,
              height: 40.h,
              margin: EdgeInsets.only(bottom: 5.h),
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(30.r)
              ),
            )
          ],
        ),
        SizedBox(
          width: 225.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(status.title, style: TextStyles.textViewBold16),
              Text(status.desc, style: TextStyles.textViewBold11.copyWith(color: grey),),
            ],
          ),
        )
      ],
    );
  }
}
