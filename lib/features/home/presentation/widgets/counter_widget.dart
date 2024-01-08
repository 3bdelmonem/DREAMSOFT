import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/features/cart/presentation/cubit/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';
import 'package:dreamsoft/features/home/presentation/bloc/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CounterWidget extends StatelessWidget {
  Item item;
  final bool fromDetails;
  CounterWidget({super.key, required this.item, required this.fromDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: extraLightGrey, borderRadius: BorderRadius.circular(30.r)),
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: (BuildContext context, CounterState state) {
          if (state is ChangeValueState) {
            if (!fromDetails) {
              context.read<AddToCartCubit>().fAddItemToCart(item);
            }
          }
        },
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  context.read<CounterCubit>().decrement(item: item);
                },
                child: Text("-", style: TextStyles.textViewExtraBold14),
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(item.quntity.toString(),
                      style: TextStyles.textViewExtraBold14);
                },
              ),
              InkWell(
                onTap: () => context.read<CounterCubit>().increment(item: item),
                child: Text("+", style: TextStyles.textViewExtraBold14),
              )
            ],
          );
        },
      ),
    );
  }
}
