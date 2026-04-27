// lib/features/register/ui/bloc/register_state.dart

part of 'register_bloc.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final AuthUser user;
  RegisterSuccess(this.user);
}

class RegisterFailure extends RegisterState {
  final String message;
  RegisterFailure(this.message);
}
