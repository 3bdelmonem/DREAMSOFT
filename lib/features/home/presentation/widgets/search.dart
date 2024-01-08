import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/core/util/icons.dart';
import 'package:dreamsoft/core/widgets/circle-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  final TextEditingController searchController;
  const Search({required this.searchController, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 260.w,
          height: 50.h,
          child: TextField(
            controller: searchController,
            maxLines: 1,
            minLines: 1,
            cursorColor: black,
            style: TextStyles.textViewSemiBold14.copyWith(color: black),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              constraints: const BoxConstraints.expand(),
              isDense: true,
              filled: true,
              fillColor: lightGrey,
              hintText: "Search...",
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(
                  searchIcon,
                  colorFilter: const ColorFilter.mode(black, BlendMode.srcIn),
                  width: 16.w,
                  height: 16.h,
                ),
              ),
              hintStyle: TextStyles.textViewRegular14.copyWith(color: grey),
              enabledBorder: OutlineInputBorder(
                gapPadding: 0,
                borderSide:  BorderSide.none,
                borderRadius: BorderRadius.circular(30.r)
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0,
                borderSide:  BorderSide.none,
                borderRadius: BorderRadius.circular(30.r)
              ),
            ),
          ),
        ),
        CircleWidget(
          onTap: (){},
          size: 50,
          child: SvgPicture.asset(
            filterIcon,
            colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
            width: 18.w,
            height: 16.h,
          ),
        )
      ],
    );
  }
}


