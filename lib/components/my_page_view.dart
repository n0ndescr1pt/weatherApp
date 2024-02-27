import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyPageView extends StatelessWidget {
  final Widget firstWidget;
  final Widget secondWidget;
  final int count;
  final PageController pageController;
  const MyPageView(
      {super.key,
      required this.firstWidget,
      required this.secondWidget,
      required this.pageController,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: [
              firstWidget,
              secondWidget,
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: count,
                    effect: const WormEffect(),
                    onDotClicked: (index) {
                      pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
