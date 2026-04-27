// lib/features/auth/domain/usecases/sign_up_usecase.dart
//
// Caso de uso: registrar usuario.
// Encapsula la lógica de negocio de registro; delega al repositorio.

import '../entities/auth_user.dart';
import '../repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  Future<AuthUser> call({
    required String email,
    required String password,
  }) {
    return _repository.signUp(email: email, password: password);
  }
}
