import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:on_in_bus/utils/auth.dart';

final _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;
  bool showPassword = false;
  bool valid = false;

  late StreamSubscription authSubscription;

  void togglePassword() {
    setState(() => showPassword = !showPassword);
  }

  void login(BuildContext context) async {
    try {
      setState(() => loading = true);
      final username = '${usernameController.text}@oninbus.dev';
      final password = passwordController.text;

      await _auth.signInWithEmailAndPassword(email: username, password: password);
    } on FirebaseAuthException catch (exception) {
      final message = getErrorMessage(exception);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao fazer login, por favor tente novamente'),
        ),
      );
    } finally {
      setState(() => loading = false);
    }
  }

  void register() {
    Navigator.pushNamed(context, '/register');
  }

  void validateFields() {
    setState(() => valid = usernameController.text.isNotEmpty && passwordController.text.isNotEmpty);
  }

  @override
  void initState() {
    super.initState();

    usernameController.addListener(validateFields);
    passwordController.addListener(validateFields);

    authSubscription = _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.of(context).pushNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Builder(
        builder: (context) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'On In Bus',
                      style: textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuário',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Senha',
                    helperText: '',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: IconButton(
                        onPressed: togglePassword,
                        splashRadius: 24,
                        icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                  ),
                  obscureText: !showPassword,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: !loading && valid ? () => login(context) : null,
                  child: loading
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(strokeWidth: 3),
                        )
                      : const Text('Entrar'),
                ),
                OutlinedButton(
                  onPressed: register,
                  child: const Text('Criar uma conta'),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
