import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/core/functions/navigate_to.dart';
import 'package:ecommerce_supabase/views/auth/ui/forgot_view.dart';
import 'package:ecommerce_supabase/views/auth/ui/signup_view.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_row_with_arrow.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_text_btn.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custome_textfield.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
    bool isPasswordHidden = true;
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
                          "Welcome To Mart🛍️",
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: maxHeight * 0.03),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 600, // Maximum width for larger screens
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomTextButton(
                                      text: "Forgot Password?",
                                      onTap: () {
                                        navigateTo(context, const ForgotView());
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: maxHeight * 0.02),
                                CustomRowWithArrowBtn(
                                  text: "Login",
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                    }
                                  },
                                ),
                                SizedBox(height: maxHeight * 0.02),
                                CustomRowWithArrowBtn(
                                  text: "Login With Google",
                                  onTap: () {},
                                ),
                                SizedBox(height: maxHeight * 0.02),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't Have an account?",
                                        style: TextStyle(
                                          fontSize: fontSize * 0.7,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: maxWidth * 0.01),
                                      CustomTextButton(
                                        text: "Sign Up",
                                        onTap: () {
                                          navigateTo(context, const SignupView());
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
