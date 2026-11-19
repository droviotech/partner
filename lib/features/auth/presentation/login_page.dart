import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/core/design/widgets/primary_button.dart';
import 'package:partner/features/auth/application/auth_cubit.dart';
import 'package:partner/features/auth/application/auth_state.dart';
import 'package:partner/l10n/generated/app_localizations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    final l10n = AppLocalizations.of(context);
    final controllerUser = TextEditingController();
    final controllerPassword = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controllerUser,
              decoration: InputDecoration(labelText: l10n.username),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controllerPassword,
              obscureText: true,
              decoration: InputDecoration(labelText: l10n.password),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: l10n.login,
              onPressed: () => cubit.login(
                username: controllerUser.text,
                password: controllerPassword.text,
              ),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) => state.error == null
                  ? const SizedBox.shrink()
                  : Text(
                      state.error == 'session_expired'
                          ? l10n.sessionExpired
                          : l10n.loginError,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
