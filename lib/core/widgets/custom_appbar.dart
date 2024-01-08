import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> appBarWidget;
  const CustomAppBar({required this.appBarWidget, super.key});
  
  @override
  Size get preferredSize => Size.fromHeight(70.h);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.transparent,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 25.w),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: appBarWidget
          ),
        ),
      )
    );
  }
}