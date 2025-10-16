import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/core/widgets/expandable_html.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';

class DescribColumn extends StatelessWidget {
  const DescribColumn({super.key, required this.products});
  final OfferModel products;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    final description = products.description;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lang.description,
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.h),
        ExpandableTextHtml(
          description.isNotEmpty ? description : lang.noDescription,
          style: Styles.textStyle16,
          text: description.isNotEmpty ? description : lang.noDescription,
        ),
      ],
    );
  }
}
