// lib/features/auth/domain/usecases/sign_in_usecase.dart
//
// Caso de uso: iniciar sesión.
// Recibe el repositorio abstracto y expone un método call().

import '../entities/auth_user.dart';
import '../repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  Future<AuthUser> call({
    required String email,
    required String password,
  }) {
    return _repository.signIn(email: email, password: password);
  }
}
