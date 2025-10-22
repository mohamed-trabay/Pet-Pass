import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:pet_pass/core/utiles/api_keys.dart';
import 'package:pet_pass/core/utiles/service_locator.dart';
import 'package:pet_pass/my_app.dart';

void main() {
  Stripe.publishableKey = ApiKeys.stripePublishableKey;

  setupServiceLocator();

  runApp(const PetPass());
}
