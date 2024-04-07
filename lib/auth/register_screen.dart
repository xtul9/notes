import 'package:flutter/material.dart';
import 'package:flutter_application_1/error/error_snack.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  void _register(BuildContext context) async {
    try {
      UserCredential uc =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      uc.user!.sendEmailVerification();

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.verificationEmailSent),
              content: Text(
                  AppLocalizations.of(context)!.verificationEmailSentContent),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(AppLocalizations.of(context)!.ok)),
              ],
            );
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ErrorSnack.show(
            context, AppLocalizations.of(context)!.passwordTooShort);
      } else if (e.code == 'email-already-in-use') {
        ErrorSnack.show(context, AppLocalizations.of(context)!.emailInUse);
      } else {
        ErrorSnack.show(context, AppLocalizations.of(context)!.registerError);
      }
    } catch (e) {
      ErrorSnack.show(context, AppLocalizations.of(context)!.registerError);
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.email,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.password,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text(AppLocalizations.of(context)!.registerAction),
            ),
          ],
        ),
      ),
    );
  }
}
