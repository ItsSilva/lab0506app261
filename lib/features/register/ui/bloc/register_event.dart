// lib/features/register/ui/bloc/register_event.dart

part of 'register_bloc.dart';

abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String password;
  final String username;

  RegisterSubmitted({
    required this.email,
    required this.password,
    required this.username,
  });
}
