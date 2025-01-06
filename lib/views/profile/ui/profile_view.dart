import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/core/functions/navigate_without_back.dart';

import 'package:ecommerce_supabase/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:ecommerce_supabase/views/auth/ui/login_view.dart';

import 'package:ecommerce_supabase/views/profile/ui/widgets/custom_row_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {

        if (state is LogoutSuccess) {
          navigateWithoutBack(context, LoginView());
        }
        if (state is LogoutError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }

      },
      builder: (context, state) {
        return Center(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .65,
            child: Card(
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
                    const CircleAvatar(
                      radius: 55,
                      backgroundColor: AppColors.kPrimaryColor,
                      foregroundColor: AppColors.kWhiteColor,
                      child: Icon(
                        Icons.person,
                        size: 45,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "User Name",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("User Email"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomRowBtn(
                      onTap: () => {},
                      icon: Icons.person,
                      text: "Edit Name",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomRowBtn(
                      onTap: () => {},
                      icon: Icons.shopping_basket,
                      text: "My Orders",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomRowBtn(
                      onTap: () async {
                        context.read<AuthenticationCubit>().logout();
                      },
                      icon: Icons.logout,
                      text: "Logout",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
