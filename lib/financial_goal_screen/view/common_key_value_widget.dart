import 'package:finance_goal_tracker/color.dart';
import 'package:flutter/material.dart';

class CommonKeyValueWidget extends StatelessWidget {
  const CommonKeyValueWidget({
    super.key,
    required this.name,
    required this.value,
    this.nameStyle,
    this.valueStyle,
    this.isShowRadio = false,
    this.color,
  });

  final String name;
  final String value;
  final TextStyle? nameStyle;
  final TextStyle? valueStyle;
  final bool isShowRadio;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isShowRadio
                ? Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: color ?? ColorUtils().secondaryBlueColor,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              name,
              style: nameStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
            ),
          ],
        ),
        Text(
          value,
          style: valueStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
        )
      ],
    );
  }
}
