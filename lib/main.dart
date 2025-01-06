import 'package:ecommerce_supabase/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:ecommerce_supabase/views/auth/ui/login_view.dart';
import 'package:ecommerce_supabase/views/nav_bar/ui/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://srpdlbscsltxoclyokwf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNycGRsYnNjc2x0eG9jbHlva3dmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYwNTk5MTIsImV4cCI6MjA1MTYzNTkxMn0.4RfFcLHssAmZv7CDkRNxkfe3xFr5KM16nEOIUBIrc4M',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SupabaseClient client =Supabase.instance.client;
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: MaterialApp(
        title: 'Ecommerce Supabase',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: client.auth.currentUser!=null? MainHomeView(): const LoginView(),
      ),
    );
  }
}
