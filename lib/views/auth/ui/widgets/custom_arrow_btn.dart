import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:flutter/material.dart';


class CustomArrowBtn extends StatelessWidget {
  const CustomArrowBtn({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final padding = maxWidth * 0.15; // 15% of width
        final borderRadius = maxWidth * 0.2; // 20% of width
        final iconSize = maxWidth * 0.4; // 40% of width
        
        return SizedBox(
          width: maxWidth,
          height: maxWidth,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 60, // Maximum size for larger screens
              maxHeight: 60,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: AppColors.kWhiteColor,
                padding: EdgeInsets.all(padding),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              onPressed: onTap,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Icon(
                  Icons.arrow_forward,
                  size: iconSize,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
