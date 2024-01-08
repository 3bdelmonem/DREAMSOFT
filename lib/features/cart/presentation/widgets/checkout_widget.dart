import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/core/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../track_order/presentation/pages/track_order_screen.dart';
import '../cubit/get_cart_cubit/get_cart_cubit_cubit.dart';

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                "Total (${context.watch<GetCartCubitCubit>().totalItems.toString()} Items)",
                style: TextStyles.textViewExtraBold14
                    .copyWith(color: checkoutGrey)),
            // Text("\$${double.parse(item.price) * state.counterValue}0", style: TextStyles.textViewBlack20)
            Text(
                "\$${context.watch<GetCartCubitCubit>().totalAmount.toString()}",
                style: TextStyles.textViewBlack20)
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TrackOrderScreen()));
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              elevation: 0,
              fixedSize: Size(325.w, 50.h),
              backgroundColor: black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Proceed to Checkout",
                  style: TextStyles.textViewBlack16.copyWith(color: white)),
              Container(
                width: 30.w,
                height: 30.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(7.r)),
                child: SvgPicture.asset(
                  rightArrowIcon,
                  colorFilter: const ColorFilter.mode(black, BlendMode.srcIn),
                  width: 15.w,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
