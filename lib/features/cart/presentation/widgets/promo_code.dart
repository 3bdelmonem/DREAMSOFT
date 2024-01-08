import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoCode extends StatelessWidget {
  final TextEditingController promoCodeController;
  const PromoCode({required this.promoCodeController, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325.w,
      height: 50.h,
      child: TextField(
        controller: promoCodeController,
        maxLines: 1,
        minLines: 1,
        cursorColor: black,
        style: TextStyles.textViewSemiBold14,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          constraints: const BoxConstraints.expand(),
          isDense: true,
          filled: true,
          fillColor: promoCodeGrey,
          hintText: "Promo Code",
          suffixIcon: InkWell(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: 60.w,
              height: 30.h,
              margin: EdgeInsets.all(10.r),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(7.r)
              ),
              child: Text("Apply", style: TextStyles.textViewBlack11.copyWith(color: white)),
            ),
          ),
          hintStyle: TextStyles.textViewRegular14.copyWith(color: grey),
          enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide:  BorderSide.none,
            borderRadius: BorderRadius.circular(10.r)
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide:  BorderSide.none,
            borderRadius: BorderRadius.circular(10.r)
          ),
        ),
      ),
    );
  }
}