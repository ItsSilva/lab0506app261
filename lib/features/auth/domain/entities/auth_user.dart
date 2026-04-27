// lib/features/auth/domain/entities/auth_user.dart
//
// Entidad de dominio: representa al usuario autenticado.
// No depende de Supabase ni de ningún SDK externo.

class AuthUser {
  final String id;
  final String email;

  const AuthUser({
    required this.id,
    required this.email,
  });
}
