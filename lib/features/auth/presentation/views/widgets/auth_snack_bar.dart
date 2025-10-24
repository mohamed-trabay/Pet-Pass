import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

void showSnackbar(
  BuildContext context,
  String message, {
  bool isError = false,
}) {
  final hasHtml = message.contains('<') && message.contains('>');

  if (hasHtml) {
    _showHtmlSnackbar(context, message, isError: isError);
  } else {
    _showTextSnackbar(context, message, isError: isError);
  }
}

void _showHtmlSnackbar(
  BuildContext context,
  String htmlMessage, {
  required bool isError,
}) {
  showTopSnackBar(
    Overlay.of(context),
    Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: isError ? Colors.redAccent : Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              isError ? Icons.error : Icons.check_circle,
              color: Colors.white,
              size: 28,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Html(
                key: UniqueKey(),
                data: htmlMessage,
                style: {
                  'body': Style(
                    margin: Margins.zero,
                    padding: HtmlPaddings.zero,
                    color: Colors.white,
                    fontSize: FontSize(14),
                  ),
                  'p': Style(margin: Margins.zero, padding: HtmlPaddings.zero),
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void _showTextSnackbar(
  BuildContext context,
  String message, {
  required bool isError,
}) {
  showTopSnackBar(
    Overlay.of(context),
    isError
        ? CustomSnackBar.error(
          message: message,
          backgroundColor: Colors.redAccent,
          icon: const Icon(Icons.error, color: Colors.white, size: 28),
        )
        : CustomSnackBar.success(
          message: message,
          backgroundColor: Colors.green,
          icon: const Icon(Icons.check_circle, color: Colors.white, size: 28),
        ),
  );
}
