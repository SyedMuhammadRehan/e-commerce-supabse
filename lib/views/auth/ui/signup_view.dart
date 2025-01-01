import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/core/functions/navigate_to.dart';
import 'package:ecommerce_supabase/views/auth/ui/login_view.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_row_with_arrow.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_text_btn.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custome_textfield.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

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
                      "Create Account🚀",
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
                            CustomTextFormField(
                              controller: _emailController,
                              labelText: "Email",
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: maxHeight * 0.02),
                            CustomTextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              labelText: "Password",
                              isSecured: isPasswordHidden,
                              suffIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordHidden = !isPasswordHidden;
                                  });
                                },
                                icon: Icon(isPasswordHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                            SizedBox(height: maxHeight * 0.02),
                            CustomTextFormField(
                              controller: _confirmPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              labelText: "Confirm Password",
                              isSecured: isConfirmPasswordHidden,
                              suffIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isConfirmPasswordHidden = !isConfirmPasswordHidden;
                                  });
                                },
                                icon: Icon(isConfirmPasswordHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                            SizedBox(height: maxHeight * 0.03),
                            CustomRowWithArrowBtn(
                              text: "Sign Up",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  // Handle signup
                                }
                              },
                            ),
                            SizedBox(height: maxHeight * 0.02),
                            CustomRowWithArrowBtn(
                              text: "Sign Up With Google",
                              onTap: () {},
                            ),
                            SizedBox(height: maxHeight * 0.02),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account?",
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
