import 'dart:developer';

import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/core/util/icons.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';
import 'package:dreamsoft/features/home/presentation/bloc/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../cart/presentation/cubit/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../../../cart/presentation/cubit/get_cart_cubit/get_cart_cubit_cubit.dart';
import '../../../cart/presentation/pages/cart_screen.dart';

class AddToCartWidget extends StatelessWidget {
  final Item item;
  const AddToCartWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Price",
                style: TextStyles.textViewSemiBold9.copyWith(color: grey)),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text("\$${double.parse(item.price) * item.quntity}0",
                    style: TextStyles.textViewBlack20);
              },
            )
          ],
        ),
        BlocConsumer<AddToCartCubit, AddToCartState>(
          listener: (context, state) {
            if (state is AddToCartSuccessState) {
              log(state.message);
              context.read<GetCartCubitCubit>().fGetCartItems();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => CartScreen(
                        fromHome: false,
                      )));
            } else {
              log('Ahaaa');
            }
          },
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  context.read<AddToCartCubit>().fAddItemToCart(item);
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    elevation: 0,
                    fixedSize: Size(200.w, 50.h),
                    backgroundColor: black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      shopCartIcon,
                      colorFilter:
                          const ColorFilter.mode(white, BlendMode.srcIn),
                      width: 16.w,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text("Add to cart",
                        style:
                            TextStyles.textViewBlack16.copyWith(color: white))
                  ],
                ));
          },
        )
      ],
    );
  }
}
