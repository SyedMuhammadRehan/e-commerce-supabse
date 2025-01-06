import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:flutter/material.dart';


class CustomEBtn extends StatelessWidget {
  const CustomEBtn({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final fontSize = maxWidth * 0.045; // 4.5% of width
        final borderRadius = maxWidth * 0.04; // 4% of width
        
        return Container(
          constraints: const BoxConstraints(
            maxWidth: 400, // Maximum width for larger screens
          ),
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimaryColor,
              foregroundColor: AppColors.kWhiteColor,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: maxWidth * 0.06, // 6% of width
                vertical: maxWidth * 0.03, // 3% of width
              ),
            ),
            onPressed: onTap,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
