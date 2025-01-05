import 'package:ecommerce_supabase/views/auth/logic/models/user_model.dart';
import 'package:flutter/material.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  // const HomeView({super.key, required this.userDataModel});
  // final UserDataModel userDataModel;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
       
          const SizedBox(
            height: 20,
          ),
          // Image.asset("assets/images/buy.jpg"),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Popular Categories",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Recently Products",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 15,
          ),

        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
