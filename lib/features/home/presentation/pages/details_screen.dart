import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/core/util/icons.dart';
import 'package:dreamsoft/core/widgets/circle-widget.dart';
import 'package:dreamsoft/core/widgets/custom_appbar.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';
import 'package:dreamsoft/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:dreamsoft/features/home/presentation/widgets/add_to_cart_widget.dart';
import 'package:dreamsoft/features/home/presentation/widgets/color_display_widget.dart';
import 'package:dreamsoft/features/home/presentation/widgets/counter_widget.dart';
import 'package:dreamsoft/features/home/presentation/widgets/image_%20carousel.dart';
import 'package:dreamsoft/features/home/presentation/widgets/size_display_widget.dart';
import 'package:dreamsoft/features/home/presentation/widgets/star_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatefulWidget {
  final Item item;
  const DetailsScreen({required this.item, super.key});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          appBarWidget: [
            CircleWidget(
              onTap: () {
                context.read<HomeBloc>().add(GetItemsEvent());
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                leftArrowIcon,
                colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                width: 18.w,
              ),
            ),
            CircleWidget(
              onTap: () {},
              size: 30,
              color: white,
              child: SvgPicture.asset(
                shopCartIcon,
                colorFilter: const ColorFilter.mode(black, BlendMode.srcIn),
                width: 13.w,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: white,
          notchMargin: 0,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          height: 75.h,
          child: AddToCartWidget(item: widget.item),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.topCenter,
                child: ImageCarousel(
                  images: widget.item.images,
                )),
            Positioned(
              top: 360,
              right: 25,
              child: CircleWidget(
                onTap: () {
                  setState(() {
                    widget.item.favorite = !widget.item.favorite;
                  });
                  context.read<HomeBloc>().changeFavorite(widget.item);
                },
                size: 30,
                color: widget.item.favorite ? red : white,
                child: SvgPicture.asset(
                  loveIcon,
                  colorFilter: ColorFilter.mode(
                      widget.item.favorite ? white : black, BlendMode.srcIn),
                  width: 14.w,
                  height: 14.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 340.h,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r))),
              child: SingleChildScrollView(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 25.w, vertical: 25.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 175.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.item.title,
                                  style: TextStyles.textViewBlack18),
                              Text(widget.item.store,
                                  style: TextStyles.textViewSemiBold11
                                      .copyWith(color: darkGrey, height: 2)),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  StarDisplayWidget(
                                      value: int.parse(widget.item.rate)),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text("(${widget.item.review} REVIEW)",
                                      style: TextStyles.textViewSemiBold11),
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CounterWidget(
                              item: widget.item,
                              fromDetails: true,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(widget.item.available,
                                style: TextStyles.textViewBlack13),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Size", style: TextStyles.textViewBlack16),
                            SizedBox(height: 10.h),
                            SizeDisplayWidget(size: widget.item.sizes)
                          ],
                        ),
                        ColorDisplayWidget(
                          color: widget.item.colors,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyles.textViewBlack16,
                        ),
                        SizedBox(height: 10.h),
                        Text(widget.item.description,
                            style: TextStyles.textViewRegular11
                                .copyWith(color: darkGrey)),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
