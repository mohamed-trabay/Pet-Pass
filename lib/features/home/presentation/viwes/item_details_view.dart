import 'package:flutter/material.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/item_details_view_body.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key, required this.productmodel});
  final OfferModel productmodel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: ItemDetailsViewBody(productmodel: productmodel)),
    );
  }
}
