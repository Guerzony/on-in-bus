import 'package:firebase_auth/firebase_auth.dart';

String getErrorMessage(FirebaseAuthException exception) {
  return {
        'user-not-found': 'Usuário ou senha incorretos',
        'wrong-password': 'Usuário ou senha incorretos',
        'weak-password': 'Senha muito fraca',
        'email-already-in-use': 'Nome de usuário já existe',
        'too-many-requests': 'Muitas tentativas de login, tente novamente mais tarde',
      }[exception.code] ??
      'Erro desconhecido';
}
