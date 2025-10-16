import 'package:flutter/material.dart';
import 'package:pet_pass/features/premium/presentaion/views/widgets/premium_view_body.dart';

class PremiumView extends StatelessWidget {
  const PremiumView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: PremiumViewBody()));
  }
}
