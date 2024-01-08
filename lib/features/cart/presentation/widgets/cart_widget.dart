import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/domain/entities/item.dart';
import '../../../home/presentation/widgets/counter_widget.dart';

class CartWidget extends StatelessWidget {
  final Item item;
  const CartWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 100.h,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(13.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 11),
                blurRadius: 24,
                color: black.withOpacity(0.1))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: 80.w,
                height: 80.h,
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsetsDirectional.only(end: 8.w),
                decoration: BoxDecoration(
                    color: darkGrey, borderRadius: BorderRadius.circular(10.r)),
                child: Image.asset(
                  item.images[0],
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title,
                          style: TextStyles.textViewBlack14,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                      Text(item.store,
                          style: TextStyles.textViewSemiBold11
                              .copyWith(color: darkGrey),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                    ],
                  ),
                  Text("\$ ${item.price}", style: TextStyles.textViewBlack14),
                ],
              )
            ],
          ),
          CounterWidget(
            item: item,
            fromDetails: false,
          )
        ],
      ),
    );
  }
}
