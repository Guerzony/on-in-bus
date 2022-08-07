import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:on_in_bus/utils/user.dart';

final _auth = FirebaseAuth.instance;

class UserDialog extends StatefulWidget {
  const UserDialog({Key? key}) : super(key: key);

  @override
  State<UserDialog> createState() => _UserDialogState();
}

class _UserDialogState extends State<UserDialog> {
  void logout() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return StreamBuilder<UserWithData?>(
      stream: userDataStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final user = snapshot.data!;

        return Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  child: Text(user.first.email?.substring(0, 1).toUpperCase() ?? 'A'),
                ),
                const SizedBox(height: 16),
                Text(
                  user.first.email ?? 'Usuário anônimo',
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                if (user.second.isAdmin)
                  const Chip(
                    label: Text('Administrador', style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.cyan,
                  ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: logout,
                  child: const Text('Sair'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
