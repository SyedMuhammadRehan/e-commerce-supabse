import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      await client.auth.signInWithPassword(password: password, email: email);
      emit(LoginSuccess());
    } on AuthException catch (e) {
      emit(LoginError(e.message));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

   Future<void> register({required String name, required String email, required String password}) async {
    emit(SignUpLoading());

    try {
      await client.auth.signUp(password: password, email: email);
      emit(SignUpSuccess());
    } on AuthException catch (e) {
      emit(SignUpError(e.message));
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }
}
