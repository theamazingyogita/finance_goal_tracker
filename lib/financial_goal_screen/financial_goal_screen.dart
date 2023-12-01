import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_goal_tracker/color.dart';
import 'package:finance_goal_tracker/financial_goal_screen/view/card_view.dart';
import 'package:finance_goal_tracker/financial_goal_screen/view/common_key_value_widget.dart';
import 'package:finance_goal_tracker/financial_goal_screen/view/contribution_progress_bar_view.dart';
import 'package:finance_goal_tracker/financial_goal_screen/view/goal_progress_view.dart';
import 'package:finance_goal_tracker/financial_goal_screen/view/goal_section_view.dart';
import 'package:flutter/material.dart';

class FinancialGoalScreen extends StatelessWidget {
  const FinancialGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: null,
      backgroundColor: ColorUtils().primaryColor,
      body: StreamBuilder(
        stream: firestore.collection('financeGoalTracker').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var data = snapshot.data?.docs[0].data() as Map<String, dynamic>;
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 24),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    const SizedBox(height: 18),
                    Text(
                      data['goal_name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GoalProgressView(data: data),
                    GoalSectionView(data: data),
                    CardView(data: data),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: .24,
                minChildSize: .24,
                maxChildSize: 0.4,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(36),
                        topLeft: Radius.circular(36),
                      ),
                      color: ColorUtils().bottomSheetColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.only(top: 24),
                      children: [
                        const CommonKeyValueWidget(
                          name: 'Contribution',
                          value: 'Show History',
                          nameStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                          valueStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        ContributionProgressBarView(data: data),
                        Flex(
                          direction: Axis.vertical,
                          children: [
                            CommonKeyValueWidget(
                              isShowRadio: true,
                              color: ColorUtils().secondaryBlueColor,
                              name: 'Monthly Salery',
                              value: '\$${data['monthly_salery']}',
                              nameStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              valueStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CommonKeyValueWidget(
                              isShowRadio: true,
                              color: ColorUtils().yellowColor,
                              name: 'Savings',
                              value: '\$${data['saving_contribution']}',
                              nameStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              valueStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CommonKeyValueWidget(
                              isShowRadio: true,
                              name: 'Investment',
                              value: '\$${data['investment_contribution']}',
                              nameStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              valueStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
