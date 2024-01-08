import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/core/util/icons.dart';
import 'package:dreamsoft/core/widgets/circle-widget.dart';
import 'package:dreamsoft/core/widgets/custom_appbar.dart';
import 'package:dreamsoft/features/cart/presentation/cubit/get_cart_cubit/get_cart_cubit_cubit.dart';
import 'package:dreamsoft/features/cart/presentation/widgets/cart_widget.dart';
import 'package:dreamsoft/features/cart/presentation/widgets/checkout_widget.dart';
import 'package:dreamsoft/features/cart/presentation/widgets/promo_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/error_widget.dart';
import '../../../home/domain/entities/item.dart';
import '../cubit/remove_from_cart/remove_from_cart_cubit.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  final bool fromHome;
  CartScreen({super.key, required this.fromHome});
  TextEditingController promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        appBarWidget: [
          fromHome
              ? const SizedBox()
              : CircleWidget(
                  onTap: () {
                    //context.read<HomeBloc>().add(GetItemsEvent());
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                    leftArrowIcon,
                    colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                    width: 18.w,
                  ),
                ),
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              SizedBox(
                height: 45.h,
                child: CircleWidget(
                  onTap: () {},
                  size: 30,
                  shadow: true,
                  color: white,
                  child: SvgPicture.asset(
                    shopCartIcon,
                    colorFilter: const ColorFilter.mode(black, BlendMode.srcIn),
                    width: 13.w,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                child: CircleWidget(
                    onTap: () {},
                    size: 13,
                    child: Text(
                      context.watch<GetCartCubitCubit>().totalItems.toString(),
                      style: TextStyles.textViewBlack7.copyWith(color: white),
                    )),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: white,
        notchMargin: 0,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        height: 110.h,
        child: const CheckoutWidget(),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Cart", style: TextStyles.textViewBlack20),
              SizedBox(
                height: 15.h,
              ),
              BlocBuilder<GetCartCubitCubit, GetCartCubitState>(
                  builder: (context, state) {
                if (state is GettingCartState) {
                  return const CircularProgressIndicator();
                } else if (state is GettingCartSuccessState) {
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          context.read<GetCartCubitCubit>().cartList.length,
                      separatorBuilder: (context, index) => Divider(
                            height: 15.h,
                            color: Colors.transparent,
                          ),
                      itemBuilder: (context, index) {
                        final Item currenItem =
                            context.read<GetCartCubitCubit>().cartList[index];
                        return BlocConsumer<RemoveFromCartCubit,
                            RemoveFromCartState>(
                          listener: (context, state) {
                            if (state is RemovingFromCartSuccessState) {
                              context.read<GetCartCubitCubit>().fGetCartItems();
                            }
                          },
                          builder: (context, state) {
                            return Dismissible(
                                onDismissed: (direction) {
                                  context
                                      .read<RemoveFromCartCubit>()
                                      .fRemoveItemFromCart(currenItem);
                                },
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  width: 325.w,
                                  height: 100.h,
                                  clipBehavior: Clip.hardEdge,
                                  alignment: AlignmentDirectional.centerEnd,
                                  margin: EdgeInsets.symmetric(vertical: 10.h),
                                  padding:
                                      EdgeInsetsDirectional.only(end: 15.w),
                                  decoration: BoxDecoration(
                                      color: black,
                                      borderRadius:
                                          BorderRadius.circular(13.r)),
                                  child: SvgPicture.asset(
                                    deleteIcon,
                                    colorFilter: const ColorFilter.mode(
                                        white, BlendMode.srcIn),
                                    height: 16.w,
                                  ),
                                ),
                                key: Key("$index"),
                                child: CartWidget(item: currenItem));
                          },
                        );
                      });
                } else {
                  return const AppErrorWidget(
                    message: 'No Data',
                  );
                }
              }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h),
                child: PromoCode(
                  promoCodeController: promoCodeController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
