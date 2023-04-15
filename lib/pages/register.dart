import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:on_in_bus/data/user.dart';
import 'package:on_in_bus/utils/auth.dart';

final _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;
  bool showPassword = false;

  void register(BuildContext context) async {
    final username = '${userController.text}@buser.dev';
    final password = passwordController.text;

    if (!Form.of(context).validate()) return;

    try {
      setState(() => loading = true);
      final credential = await _auth.createUserWithEmailAndPassword(email: username, password: password);
      final id = credential.user?.uid;
      if (id != null) {
        await usersRef.doc(id).set(UserData(isAdmin: false));
      }
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

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Novo usuário'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: userController,
                  decoration: const InputDecoration(
                    label: Text('Usuário'),
                    border: OutlineInputBorder(),
                    helperText: '',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value?.isNotEmpty == true ? null : 'Campo obrigatório',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    label: Text('Senha'),
                    border: OutlineInputBorder(),
                    helperText: '',
                  ),
                  obscureText: !showPassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value?.isNotEmpty == true ? null : 'Campo obrigatório',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Confirmar senha'),
                    border: OutlineInputBorder(),
                    helperText: '',
                  ),
                  obscureText: !showPassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value?.isEmpty == true
                      ? 'Campo obrigatório'
                      : value != passwordController.text
                          ? 'Senhas não conferem'
                          : null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Mostrar senha'),
                    Checkbox(
                      value: showPassword,
                      onChanged: (value) => setState(() => showPassword = value ?? false),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: !loading ? () => register(context) : null,
                  child: loading
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(strokeWidth: 3),
                        )
                      : const Text('Criar usuário'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
