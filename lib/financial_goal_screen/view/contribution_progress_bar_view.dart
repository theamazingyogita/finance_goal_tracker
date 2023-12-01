import 'package:finance_goal_tracker/color.dart';
import 'package:flutter/material.dart';

class ContributionProgressBarView extends StatelessWidget {
  const ContributionProgressBarView({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            height: 14,
            width: parseAndConvertToInt(data['goal_amount']) / 100,
            decoration: BoxDecoration(
              color: ColorUtils().tealColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            height: 14,
            width: parseAndConvertToInt(data['extra_contribution']) / 100,
            decoration: BoxDecoration(
              color: ColorUtils().yellowColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            height: 14,
            width: parseAndConvertToInt(data['total_saving']) / 100,
            decoration: BoxDecoration(
              color: ColorUtils().secondaryBlueColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}

int parseAndConvertToInt(String jsonString) {
  String cleanedString = jsonString.replaceAll(',', '');
  int intValue = int.tryParse(cleanedString) ?? 0;

  return intValue;
}
