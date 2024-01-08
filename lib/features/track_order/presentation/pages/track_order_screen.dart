import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/icons.dart';
import '../../../../core/widgets/circle-widget.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../cubit/track_order_cubit.dart';
import '../widgets/collection_card_widget.dart';
import '../widgets/map_widget.dart';
import '../widgets/status_stepper_widget.dart';
class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarWidget: [
          CircleWidget(
            onTap: () {Navigator.of(context).pop();},
            child: SvgPicture.asset(
              leftArrowIcon,
              colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
              width: 18.w,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.w,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("US 2343445668", style: TextStyles.textViewBlack18,),
            Text("El-Mahalla El-Kobra",style: TextStyles.textViewMedium13.copyWith(color: grey)),
            const MapWidget(),
            Text("Collection Point", style: TextStyles.textViewBlack18),
            SizedBox(height: 10.h),
            CollectionCardWidget(
              text1: "10:00-11:00 - 25 June,2023",
              text2: "3512 Nagercoil ,India",
              button: CircleWidget(
                onTap: (){},
                child: SvgPicture.asset(
                  mapIcon,
                  colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                  width: 16.w,
                ),
              ),
            ),
            const Divider(thickness: 1),
            CollectionCardWidget(
              text1: "you can change pick-up time for",
              text2: "your order by 10:00, 24 June",
              button: Container(
                width: 60.w,
                height: 30.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Text("Change",style: TextStyles.textViewMedium11.copyWith(color: white)),
              )
            ),
            SizedBox(height: 25.h),
            Text("History", style: TextStyles.textViewBlack18),
            SizedBox(height: 10.h),
            BlocProvider<TrackOrderCubit>(
              lazy: false,
              create: (context) => TrackOrderCubit(),
              child: BlocBuilder<TrackOrderCubit, TrackOrderState>(
                builder: (context, state) {
                  var cubitList = context.read<TrackOrderCubit>().orderStatus;
                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: 25.h),
                    itemCount: cubitList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => StatusStepperWidget(
                      isBottom: index == cubitList.length - 1,
                      status: cubitList[index],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}