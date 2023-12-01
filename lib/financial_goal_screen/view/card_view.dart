import 'package:finance_goal_tracker/color.dart';
import 'package:flutter/material.dart';

import 'common_key_value_widget.dart';

class CardView extends StatelessWidget {
  const CardView({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorUtils().secondaryBlueColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          CommonKeyValueWidget(
            name: 'Need More Savings',
            value: '\$${data['remaining_amount']}',
          ),
          const SizedBox(height: 4),
          CommonKeyValueWidget(
            name: 'Monthly Saving Projections',
            value: '\$${data['montly_saving_goal']}',
          ),
        ],
      ),
    );
  }
}
