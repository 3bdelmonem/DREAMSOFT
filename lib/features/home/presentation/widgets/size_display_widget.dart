import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: must_be_immutable
class SizeDisplayWidget extends StatefulWidget {
  final List<String> size;
  const SizeDisplayWidget({required this.size, super.key});

  @override
  State<SizeDisplayWidget> createState() => _SizeDisplayWidgetState();
}

class _SizeDisplayWidgetState extends State<SizeDisplayWidget> {
  int activeSize = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.size.length, (index) {
        return widget.size[0] == "One Size"?
        Container(
          height: 40.h,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: black,
            borderRadius: BorderRadius.circular(30.r)
          ),
          child: Text(widget.size[index], style: TextStyles.textViewExtraBold14.copyWith(color: white)),
        ):
        InkWell(
          onTap: () {
            setState(() {activeSize = index;});
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            alignment: Alignment.center,
            margin: EdgeInsetsDirectional.only(end: 10.w),
            decoration: BoxDecoration(
              color: index == activeSize ? black : white,
              shape: BoxShape.circle,
              border: Border.all(color: index == activeSize ? Colors.transparent : avatarGrey, width: 1.r, strokeAlign: BorderSide.strokeAlignOutside)
            ),
            child: Text(widget.size[index], style: TextStyles.textViewExtraBold14.copyWith(color: index == activeSize ? white : avatarGrey),),
          ),
        );
      }),
    );
  }
}