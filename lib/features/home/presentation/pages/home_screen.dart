import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/core/util/icons.dart';
import 'package:dreamsoft/core/util/images.dart';
import 'package:dreamsoft/core/widgets/circle-widget.dart';
import 'package:dreamsoft/core/widgets/custom_appbar.dart';
import 'package:dreamsoft/core/widgets/error_widget.dart';
import 'package:dreamsoft/core/widgets/loading_widget.dart';
import 'package:dreamsoft/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:dreamsoft/features/home/presentation/widgets/home_banner.dart';
import 'package:dreamsoft/features/home/presentation/widgets/new_arrivals_item.dart';
import 'package:dreamsoft/features/home/presentation/widgets/search.dart';
import 'package:dreamsoft/features/layout/presentation/cubit/bnb/bnb_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: white,
          appBar: CustomAppBar(
            appBarWidget: [
              CircleWidget(
                onTap: () {Scaffold.of(context).openDrawer();},
                child: SvgPicture.asset(
                  drawerIcon,
                  colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                  width: 15.w,
                ),
              ),
              CircleWidget(
                onTap: () {BlocProvider.of<BnbCubit>(context).changeIndex(currentIndex: 3);},
                size: 50,
                color: avatarGrey,
                child: Image.asset(avatarImage),
              )
            ],
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if(state is LoadingGetItemState) {
                return const Center(child: LoadingWidget());
              }
              else if (state is ErrorGetItemState) {
                return Center(child: AppErrorWidget(message: state.message));
              }
              else if (state is LoadedGetItemState) {
                return SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome,", style:TextStyles.textViewBlack25.copyWith(height: 1.5.h)),
                          Text("Our Fashions App", style: TextStyles.textViewExtraBold20.copyWith(color: darkGrey)),
                          SizedBox(height: 15.h),
                          Search(searchController: searchController)
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 160.h,
                      margin: EdgeInsets.symmetric(vertical: 25.h),
                      child: ListView.builder(
                        padding: EdgeInsetsDirectional.only(start: 25.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const HomeBanner();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 25.w, left: 25.w, bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("New Arrivals", style: TextStyles.textViewBlack18),
                          Text("View All", style: TextStyles.textViewExtraBold13.copyWith(color: darkGrey)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 500.h,
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          return NewArrivalsItem(item: state.items[index]);
                        },
                      ),
                    )
                  ],
                ),
              );
            }
            return const Center(child: AppErrorWidget(message: "Unexpected Error please try again later"));
          },
        )
      ),
    );
  }
}