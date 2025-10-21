import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/core/widgets/expandable_html.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_buttom.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/item_details/describ_column.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/item_details/show_dialog.dart';

class ItemDetailsSection extends StatefulWidget {
  const ItemDetailsSection({super.key, required this.products});
  final OfferModel products;

  @override
  State<ItemDetailsSection> createState() => _ItemDetailsSectionState();
}

class _ItemDetailsSectionState extends State<ItemDetailsSection> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(
          widget.products.name,
          style: Styles.textStyle24,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10.h),
        Text(lang.free, style: Styles.textStyle18),
        SizedBox(height: 10.h),
        ExpandableTextHtml(
          widget.products.shortDescription.isNotEmpty
              ? widget.products.shortDescription
              : lang.noDescription,
          style: Styles.textStyle16,
          text:
              widget.products.shortDescription.isNotEmpty
                  ? widget.products.shortDescription
                  : lang.noDescription,
        ),

        SizedBox(height: 20.h),
        CustomButton(
          height: 50.h,
          width: 200.w,
          title: lang.reedem,
          onPressed: () {
            showDiscountDialog(context, widget, lang);
          },
        ),
        SizedBox(height: 20.h),
        DescribColumn(products: widget.products),
      ],
    );
  }
}
