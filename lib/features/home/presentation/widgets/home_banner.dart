import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/core/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      height: 160.h,
      padding: EdgeInsets.all(15.r),
      margin: EdgeInsetsDirectional.only(end: 15.w),
      decoration: BoxDecoration(
        color: darkGrey,
        borderRadius: BorderRadius.circular(20.r),
        image: const DecorationImage(
          image: AssetImage(bannerImage),
          fit: BoxFit.cover
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "50% Off",
                style: TextStyles.textViewBlack25,
              ),
              Text(
                "On everything today",
                style: TextStyles.textViewRegular16,
              )
            ]
          ),
           Text(
            "With code:FSCREATION",
            style: TextStyles.textViewExtraBold11.copyWith(color: darkGrey),
          ),
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(5.r),
              elevation: 0,
              minimumSize: Size(70.w, 25.h),
              backgroundColor: black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r))
            ),
            child: Text(
              "Get Now",
              style: TextStyles.textViewExtraBold11.copyWith(color: white),
            ),
          )

        ],
      ),
    );
  }
}