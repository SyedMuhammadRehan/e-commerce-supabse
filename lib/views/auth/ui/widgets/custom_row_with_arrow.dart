import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_arrow_btn.dart';
import 'package:flutter/material.dart';

class CustomRowWithArrowBtn extends StatelessWidget {
  const CustomRowWithArrowBtn({
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
        
        return Container(
          constraints: const BoxConstraints(
            maxWidth: 500, // Maximum width for larger screens
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
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
              SizedBox(width: maxWidth * 0.03), // 3% spacing
              CustomArrowBtn(
                onTap: onTap,
              ),
            ],
          ),
        );
      },
    );
  }
}
