// ignore_for_file: file_names
import 'package:dreamsoft/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;
  const ImageCarousel({required this.images, super.key});
  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late PageController _pageController;
  int activePage = 1;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: activePage);
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        width: 15.w,
        height: 15.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: currentIndex == index? white : Colors.transparent, width: 1.r,
            strokeAlign:BorderSide.strokeAlignInside
          )
        ),
        child: Container(
          width: 7.w,
          height: 7.h,
          decoration: const BoxDecoration(
            color: white,
            shape: BoxShape.circle,
          ),
        ),
      );
    });
  }

  AnimatedContainer slider(List<String> images, index, active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      child: InkWell(
        onTap: () async{
          return showDialog(
            barrierColor: black,
            context: context,
            builder: (context) {
              return GestureDetector( 
                onTap: () => Navigator.of(context).pop(),
                child: Center(child: Image.asset(images[index], fit: BoxFit.contain))
              );
            }
          );
        },
        child: Image.asset(images[index], fit: BoxFit.cover)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: double.infinity,
          height: 430.h,
          child: PageView.builder(
            itemCount: widget.images.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) => setState(() {activePage = page;}),
            itemBuilder: (context, index) {
              bool active = index == activePage;
              return slider(widget.images, index, active);
            }
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(widget.images.length, activePage)
          ),
        )
      ],
    );
  }
}