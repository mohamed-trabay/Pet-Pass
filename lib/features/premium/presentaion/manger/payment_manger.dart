import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:pet_pass/core/utiles/api_keys.dart';
import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';

abstract class PaymentManager {
  static Future<void> makePayment(
    BuildContext context,
    int amount,
    String currency,
    String planType,
  ) async {
    try {
      String clientSecret = await _getClientSecret(
        (amount * 100).toString(),
        currency,
      );
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();

      await _updateUserRole(context, planType);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Payment successful! Your subscription is now active.',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Payment failed: ${error.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "My Pet Pass",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      data: {'amount': amount, 'currency': currency},
    );
    return response.data["client_secret"];
  }

  static Future<void> _updateUserRole(
    BuildContext context,
    String planType,
  ) async {
    try {
      final authCubit = context.read<AuthCubit>();
      final currentState = authCubit.state;

      if (currentState is ProfileLoaded) {
        final userId = currentState.profile.id.toString();

        String role;
        if (planType == 'monthly') {
          role = 'pms_subscription_plan_1902';
        } else {
          role = 'pms_subscription_plan_3080';
        }

        await authCubit.updateUserRole(userId: userId, role: role);
      }
    } catch (e) {
      debugPrint('Error updating role: $e');
    }
  }
}
