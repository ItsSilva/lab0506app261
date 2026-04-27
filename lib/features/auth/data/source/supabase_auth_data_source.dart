// lib/features/auth/data/source/supabase_auth_data_source.dart
//
// Única capa que conoce el SDK de Supabase.
// Convierte las respuestas del SDK en entidades de dominio (AuthUser).

import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/auth_user.dart';

class SupabaseAuthDataSource {
  final SupabaseClient _client;

  SupabaseAuthDataSource(this._client);

  Future<AuthUser> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final user = response.user;
    if (user == null) {
      throw Exception('Error al iniciar sesión: usuario nulo.');
    }

    return AuthUser(id: user.id, email: user.email ?? email);
  }

  Future<AuthUser> signUp({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
    );

    final user = response.user;
    if (user == null) {
      throw Exception('Error al registrarse: usuario nulo.');
    }

    return AuthUser(id: user.id, email: user.email ?? email);
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  /// Goal 10 – inserta el username en la tabla `profiles` de Supabase.
  Future<void> createProfile({
    required String userId,
    required String username,
  }) async {
    await _client.from('profiles').insert({
      'id': userId,
      'username': username,
    });
  }
}
