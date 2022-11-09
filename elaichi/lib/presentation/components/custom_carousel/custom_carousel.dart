import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    required this.pageController,
    required this.width,
    required this.height,
  }) : super(key: key);

  final Widget Function(BuildContext context, int selectedIndex) itemBuilder;

  final int itemCount;

  final double width;

  final double height;

  final PageController pageController;

  @override
  CustomCarouselState createState() => CustomCarouselState();
}

class CustomCarouselState extends State<CustomCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: PageView.builder(
            itemBuilder: widget.itemBuilder,
            itemCount: widget.itemCount,
            clipBehavior: Clip.none,
            controller: widget.pageController,
          ),
        ),
      ],
    );
  }
}
