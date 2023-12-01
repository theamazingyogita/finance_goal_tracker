import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorView extends StatelessWidget {
  LoadingIndicatorView({
    super.key,
    required this.data,
  });

  Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return CircularSeekBar(
      width: double.infinity,
      height: 300,
      progress: 25000,
      interactive: true,
      maxProgress: 50000,
      barWidth: 8,
      startAngle: 28,
      sweepAngle: 300,
      strokeCap: StrokeCap.round,
      progressColor: Colors.white,
      innerThumbStrokeWidth: 3,
      innerThumbColor: Colors.white,
      animation: true,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.home_rounded,
            color: Colors.white,
            size: 100,
          ),
          Text(
            '\$${data['total_saving']}',
            style: const TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700),
          ),
          Text(
            'You Saved',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }
}
