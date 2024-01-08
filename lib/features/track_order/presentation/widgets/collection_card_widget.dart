import 'package:dreamsoft/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/styles.dart';

class CollectionCardWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final Widget button;
  const CollectionCardWidget(
      {super.key,
      required this.text1,
      required this.text2,
      required this.button});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 225.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text1,style: TextStyles.textViewMedium13.copyWith(color: grey)),
              Text(text2,style: TextStyles.textViewMedium13.copyWith(color: grey)),
            ],
          ),
        ),
        button
      ],
    );
  }
}
