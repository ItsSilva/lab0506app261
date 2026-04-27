// lib/features/auth/domain/repository/auth_repository.dart
//
// Contrato abstracto. La capa de dominio sólo habla en términos
// de negocio: signIn, signUp, signOut.
// No sabe nada de Supabase, Firebase ni ninguna implementación concreta.

import '../entities/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser> signIn({
    required String email,
    required String password,
  });

  Future<AuthUser> signUp({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
