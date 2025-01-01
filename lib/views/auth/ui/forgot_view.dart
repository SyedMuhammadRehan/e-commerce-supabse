import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/core/functions/navigate_to.dart';
import 'package:ecommerce_supabase/views/auth/ui/login_view.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_row_with_arrow.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_text_btn.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custome_textfield.dart';
import 'package:flutter/material.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final maxWidth = size.width;
    final maxHeight = size.height;
    final paddingHorizontal = maxWidth * 0.05;
    final fontSize = maxWidth * 0.05;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: maxHeight),
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Reset Password🔑",
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: maxHeight * 0.03),
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 600,
                    ),
                    child: Card(
                      color: AppColors.kWhiteColor,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(maxWidth * 0.04),
                        child: Column(
                          children: [
                            Text(
                              "Enter your email address to receive a password reset link",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: fontSize * 0.7,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: maxHeight * 0.03),
                            CustomTextFormField(
                              controller: _emailController,
                              labelText: "Email",
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: maxHeight * 0.03),
                            CustomRowWithArrowBtn(
                              text: "Send Reset Link",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  // Handle password reset
                                }
                              },
                            ),
                            SizedBox(height: maxHeight * 0.02),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Remember your password?",
                                    style: TextStyle(
                                      fontSize: fontSize * 0.7,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: maxWidth * 0.01),
                                  CustomTextButton(
                                    text: "Login",
                                    onTap: () {
                                      navigateTo(context, const LoginView());
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
