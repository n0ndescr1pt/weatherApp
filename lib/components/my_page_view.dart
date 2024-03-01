import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyPageView extends StatelessWidget {
  final List<Widget> widgets;
  final double height;
  final PageController pageController;
  const MyPageView(
      {super.key,
      required this.widgets,
      required this.pageController,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          PageView(controller: pageController, children: widgets),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: widgets.length,
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
