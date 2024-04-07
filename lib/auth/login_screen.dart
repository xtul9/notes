import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.login),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.email,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.password,
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await auth.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    } catch (e) {
                      // Handle login error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppLocalizations.of(context)!.failedLogin,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.loginAction,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
