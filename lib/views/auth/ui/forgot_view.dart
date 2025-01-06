import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_elevated_btn.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custome_textfield.dart';
import 'package:flutter/material.dart';


class ForgotView extends StatefulWidget {
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: 
              
              SafeArea(
                  child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Enter Your Email To Reset Password",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
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
                              CustomEBtn(
                                text: "Sumbit",
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                 
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
        );
    
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
