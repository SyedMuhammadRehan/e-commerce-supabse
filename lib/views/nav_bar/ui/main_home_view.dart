import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/views/auth/logic/models/user_model.dart';
import 'package:ecommerce_supabase/views/favorite/ui/favorite_view.dart';
import 'package:ecommerce_supabase/views/home/ui/home_view.dart';
import 'package:ecommerce_supabase/views/profile/ui/profile_view.dart';
import 'package:ecommerce_supabase/views/store/ui/store_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class MainHomeView extends StatefulWidget {
  MainHomeView({super.key, required this.userDataModel});
  final UserDataModel userDataModel;

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
late List<Widget> views;
  @override
  void initState() {
     views = [
     HomeView(userDataModel: widget.userDataModel,),
    const StoreView(),
    const FavoriteView(),
    const ProfileView(),
  ];

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return 
          
           Scaffold(
            body: SafeArea(
              child: views[1],
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: AppColors.kWhiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
                child: GNav(
                    onTabChange: (index) {
              
                    },
                    rippleColor: AppColors
                        .kPrimaryColor, // tab button ripple color when pressed
                    hoverColor:
                        AppColors.kPrimaryColor, // tab button hover color
                    duration: const Duration(
                        milliseconds: 400), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: AppColors.kGreyColor, // unselected icon color
                    activeColor:
                        AppColors.kWhiteColor, // selected icon and text color
                    iconSize: 24, // tab button icon size
                    tabBackgroundColor: AppColors
                        .kPrimaryColor, // selected tab background color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ), // navigation bar padding
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.store,
                        text: 'Store',
                      ),
                      GButton(
                        icon: Icons.favorite,
                        text: 'Favorite',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                      )
                    ]),
              ),
            ),
          );
        }
     
  }

