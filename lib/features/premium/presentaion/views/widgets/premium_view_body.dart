import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/widgets/center_title.dart';
import 'package:pet_pass/features/premium/presentaion/views/widgets/payment_container.dart';

class PremiumViewBody extends StatelessWidget {
  const PremiumViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(20.0.r),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CenteredTitle(title: lang.premium),
            SizedBox(height: 19.h),
            const PaymentContainer(),

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
