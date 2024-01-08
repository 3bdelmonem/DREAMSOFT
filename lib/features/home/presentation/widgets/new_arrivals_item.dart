import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/util/colors.dart';
import 'package:dreamsoft/core/util/icons.dart';
import 'package:dreamsoft/core/widgets/circle-widget.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';
import 'package:dreamsoft/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:dreamsoft/features/home/presentation/pages/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewArrivalsItem extends StatefulWidget {
  final Item item;
  const NewArrivalsItem({required this.item, super.key});
  @override
  State<NewArrivalsItem> createState() => _NewArrivalsItemState();
}

class _NewArrivalsItemState extends State<NewArrivalsItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155.w,
      height: 240.h,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsScreen(item: widget.item)));
            },
            child: Container(
              width: double.infinity,
              height: 170.h,
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.only(bottom: 10.h),
              alignment: AlignmentDirectional.topEnd,
              decoration: BoxDecoration(
                  color: darkGrey,
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                      image: AssetImage(widget.item.images[0]),
                      fit: BoxFit.cover)),
              child: CircleWidget(
                onTap: () {
                  setState(() {
                    widget.item.favorite = !widget.item.favorite;
                  });
                  context.read<HomeBloc>().changeFavorite(widget.item);
                },
                size: 25,
                color: widget.item.favorite ? red : black,
                child: SvgPicture.asset(
                  loveIcon,
                  colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                  width: 12.w,
                  height: 12,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 140.w,
            child: Text(
              widget.item.title,
              style: TextStyles.textViewBlack14,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 140.w,
            child: Text(
              widget.item.store,
              style: TextStyles.textViewExtraBold11.copyWith(color: darkGrey),
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 140.w,
            child: Text(
              "\$${widget.item.price}",
              style: TextStyles.textViewBlack14,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
