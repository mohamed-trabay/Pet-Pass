import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/widgets/center_title.dart';
import 'package:pet_pass/features/premium/presentaion/manger/payment_manger.dart';
import 'package:pet_pass/features/premium/presentaion/views/widgets/payment_container.dart';

class PlansBuild extends StatelessWidget {
  const PlansBuild({super.key, required this.context, required this.lang});

  final BuildContext context;
  final AppLocalizations lang;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CenteredTitle(title: lang.selectPlan),
          SizedBox(height: 19.h),
          PaymentContainer(
            planName: lang.monthly,
            price: lang.monthlyPay,
            features: [
              lang.monthlyDesc,
              lang.monthlyFeature1,
              lang.monthlyFeature2,
            ],
            onTap: () {
              PaymentManager.makePayment(context, 29, 'AED', 'monthly');
            },
          ),
          SizedBox(height: 16.h),
          PaymentContainer(
            planName: lang.yearly,
            price: lang.yearlyPay,
            features: [
              lang.yearlyDesc,
              lang.yearlyFeature1,
              lang.yearlyFeature2,
            ],
            onTap: () {
              PaymentManager.makePayment(context, 290, 'AED', 'yearly');
            },
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
