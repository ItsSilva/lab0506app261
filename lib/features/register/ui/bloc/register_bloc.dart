// lib/features/register/ui/bloc/register_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../features/auth/data/source/supabase_auth_data_source.dart';
import '../../../../features/auth/domain/entities/auth_user.dart';
import '../../../../features/auth/domain/usecases/sign_up_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SignUpUseCase _signUpUseCase;
  // Necesitamos acceso al data source para createProfile (Goal 10)
  final SupabaseAuthDataSource _dataSource;

  RegisterBloc(this._signUpUseCase, this._dataSource)
      : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      final user = await _signUpUseCase(
        email: event.email,
        password: event.password,
      );

      // Goal 10 – inserta el perfil en la tabla `profiles`
      await _dataSource.createProfile(
        userId: user.id,
        username: event.username,
      );

      emit(RegisterSuccess(user));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
