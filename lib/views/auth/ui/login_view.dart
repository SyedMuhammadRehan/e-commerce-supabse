import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/core/functions/navigate_to.dart';
import 'package:ecommerce_supabase/core/functions/navigate_without_back.dart';
import 'package:ecommerce_supabase/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:ecommerce_supabase/views/auth/ui/forgot_view.dart';
import 'package:ecommerce_supabase/views/auth/ui/signup_view.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_row_with_arrow.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_text_btn.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custome_textfield.dart';
import 'package:ecommerce_supabase/views/home/ui/home_view.dart';
import 'package:ecommerce_supabase/views/nav_bar/ui/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit,AuthenticationState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          navigateWithoutBack(context,  MainHomeView());
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
    // do stuff here based on BlocA's state
  },

      builder: (context,state) {
        return Scaffold(
              body: 
                  
                   SafeArea(
                      child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Welcome To Our Market",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Card(
                              color: AppColors.kWhiteColor,
                              margin: const EdgeInsets.all(24),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    CustomTextFormField(
                                      controller: emailController,
                                      labelText: "Email",
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextFormField(
                                      controller: passwordController,
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
                                    const SizedBox(
                                      height: 20,
                                    ),
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
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomRowWithArrowBtn(
                                      text: "Login",
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                       context.read<AuthenticationCubit>().login(email: emailController.text, password: passwordController.text);
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomRowWithArrowBtn(
                                      text: "Login With Google",
                                      onTap: () => {}
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Don't Have an account?",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustomTextButton(
                                            text: "Sign Up",
                                            onTap: () {
                                              navigateTo(
                                                  context, const SignupView());
                                            })
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
          
          
            );
      }
    );
   
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
