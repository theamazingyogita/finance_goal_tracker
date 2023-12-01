import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'loading_indicator_view.dart';

class GoalProgressView extends StatelessWidget {
  const GoalProgressView({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Flex(
        direction: Axis.vertical,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 1.5,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index, reason) {},
            ),
            items: [
              LoadingIndicatorView(data: data),
              const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 24),
          DotsIndicator(
            dotsCount: 5,
            position: 0,
            decorator: const DotsDecorator(activeColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
