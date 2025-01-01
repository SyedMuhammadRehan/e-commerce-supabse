import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.suffIcon,
    this.isSecured = false,
    this.keyboardType,
    this.controller,
  });
  final String labelText;
  final Widget? suffIcon;
  final bool isSecured;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final borderWidth = maxWidth * 0.003; // 0.3% of width
        final borderRadius = maxWidth * 0.02; // 2% of width
        final fontSize = maxWidth * 0.04; // 4% of width
        final contentPadding = EdgeInsets.symmetric(
          horizontal: maxWidth * 0.03,
          vertical: maxWidth * 0.02,
        );

        return Container(
          constraints: const BoxConstraints(
            maxWidth: 500, // Maximum width for larger screens
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isSecured,
            style: TextStyle(fontSize: fontSize),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This Field is Required";
              }
              return null;
            },
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(fontSize: fontSize),
              suffixIcon: suffIcon != null 
                ? IconTheme(
                    data: IconThemeData(size: fontSize * 1.2),
                    child: suffIcon!,
                  )
                : null,
              contentPadding: contentPadding,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.kBordersideColor,
                  width: borderWidth,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.kBordersideColor,
                  width: borderWidth,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.kBordersideColor,
                  width: borderWidth * 1.5, // Slightly thicker when focused
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              errorStyle: TextStyle(fontSize: fontSize * 0.7),
            ),
          ),
        );
      },
    );
  }
}
