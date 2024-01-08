import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/core/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: must_be_immutable
class ColorDisplayWidget extends StatefulWidget {
  final List<String> color;
  const ColorDisplayWidget({required this.color, super.key});
  @override
  State<ColorDisplayWidget> createState() => _ColorDisplayWidgetState();
}

class _ColorDisplayWidgetState extends State<ColorDisplayWidget> {
  int activeColor = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40* widget.color.length.toDouble(),
      padding: EdgeInsets.all(7.r),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.1),
            blurRadius: 20
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.color.length, (index) {
          String color = "FF${widget.color[index]}";
          return InkWell(
            onTap: () {setState(() {activeColor = index;});},
            child: Container(
              width: 20.w,
              height: 20.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(int.parse(color, radix: 16)),
                shape: BoxShape.circle,
                border: Border.all(color: index == activeColor ? borderGrey : Colors.transparent, width: 1.r, strokeAlign: BorderSide.strokeAlignOutside)
              ),
              child: index == activeColor ?
               SvgPicture.asset(
                rightIcon,
                colorFilter: const ColorFilter.mode(black, BlendMode.srcIn),
                width: 9.w,
              ) : const SizedBox(),
            ),
          );
        }),
      ),
    );
  }
}