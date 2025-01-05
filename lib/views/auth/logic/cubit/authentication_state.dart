part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}
final class LoginSuccess extends AuthenticationState {}
final class LoginLoading extends AuthenticationState {}
final class LoginError extends AuthenticationState {

  final String error;
  LoginError(this.error);
}


final class SignUpSuccess extends AuthenticationState {}
final class SignUpLoading extends AuthenticationState {}
final class SignUpError extends AuthenticationState {
  final String error;
  SignUpError(this.error);
}