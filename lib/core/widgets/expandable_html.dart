import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/utiles/styles.dart';

class ExpandableTextHtml extends StatefulWidget {
  final String text;
  final double collapsedHeight;
  final TextStyle? linkStyle;

  const ExpandableTextHtml(
    String name, {
    super.key,
    required this.text,
    this.collapsedHeight = 70,
    this.linkStyle,
    required TextStyle style,
  });

  @override
  State<ExpandableTextHtml> createState() => _ExpandableTextHtmlState();
}

class _ExpandableTextHtmlState extends State<ExpandableTextHtml> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final description = widget.text;

    if (description.trim().isEmpty) {
      return Text(
        "No description available",
        style: Styles.textStyle16.copyWith(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          firstChild: SizedBox(
            height: widget.collapsedHeight.h,
            child: Html(
              data: description,
              style: {
                'body': Style(
                  fontSize: FontSize(16),
                  fontWeight: FontWeight.w400,
                  margin: Margins.zero,
                ),
              },
            ),
          ),
          secondChild: Html(
            data: description,
            style: {
              'body': Style(
                fontSize: FontSize(16),
                fontWeight: FontWeight.w400,
                margin: Margins.zero,
              ),
            },
          ),
        ),
        InkWell(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              isExpanded ? "Read less" : "Read more",
              style:
                  widget.linkStyle ??
                  Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
