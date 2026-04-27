// lib/features/auth/data/repository/auth_repository_impl.dart
//
// Implementación concreta del contrato de dominio.
// Es el puente entre la capa de dominio y el data source.
// La UI NUNCA importa este archivo directamente.

import '../../domain/entities/auth_user.dart';
import '../../domain/repository/auth_repository.dart';
import '../source/supabase_auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseAuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<AuthUser> signIn({
    required String email,
    required String password,
  }) {
    return _dataSource.signIn(email: email, password: password);
  }

  @override
  Future<AuthUser> signUp({
    required String email,
    required String password,
  }) {
    return _dataSource.signUp(email: email, password: password);
  }

  @override
  Future<void> signOut() {
    return _dataSource.signOut();
  }
}
