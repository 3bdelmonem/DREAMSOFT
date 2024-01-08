import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/core/util/icons.dart';
import 'package:dreamsoft/features/cart/presentation/pages/cart_screen.dart';
import 'package:dreamsoft/features/home/presentation/pages/home_screen.dart';
import 'package:dreamsoft/features/layout/presentation/cubit/bnb/bnb_cubit.dart';
import 'package:dreamsoft/features/layout/presentation/widgets/selected_bnb_item.dart';
import 'package:dreamsoft/features/layout/presentation/widgets/unselected_bnb_item.dart';
import 'package:dreamsoft/features/notification/presentation/pages/notification_screen.dart';
import 'package:dreamsoft/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> pages = [
  HomeScreen(),
  CartScreen(
    fromHome: true,
  ),
  const NotificationScreen(),
  const ProfileScreen()
];

List<BottomNavigationBarItem> items = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      activeIcon: SelectedBnbItem(icon: homeIcon, label: "Home"),
      icon: UnSelectedBnbItem(icon: homeIcon),
      label: ''),
  BottomNavigationBarItem(
      activeIcon: SelectedBnbItem(icon: cartIcon, label: "Cart"),
      icon: UnSelectedBnbItem(icon: cartIcon),
      label: ''),
  BottomNavigationBarItem(
      activeIcon:
          SelectedBnbItem(icon: notificationIcon, label: "Notification"),
      icon: UnSelectedBnbItem(icon: notificationIcon),
      label: ''),
  BottomNavigationBarItem(
      activeIcon: SelectedBnbItem(icon: profileIcon, label: "profile"),
      icon: UnSelectedBnbItem(icon: profileIcon),
      label: ''),
];

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BnbCubit, BnbState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: white,
          body: pages[state.bnbIndex],
          bottomNavigationBar: Container(
            height: 70.h,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: gold,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r)),
                boxShadow: [
                  BoxShadow(
                      color: black.withOpacity(0.1),
                      offset: Offset(0, -2.h),
                      blurRadius: 7.r)
                ]),
            child: BottomNavigationBar(
              useLegacyColorScheme: false,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              items: items,
              currentIndex: state.bnbIndex,
              onTap: (index) {
                context.read<BnbCubit>().changeIndex(currentIndex: index);
              },
            ),
          ),
        );
      },
    );
  }
}
