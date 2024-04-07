import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/auth/auth.dart';
import 'package:flutter_application_1/error/error_page.dart';
import 'package:flutter_application_1/home/home_page.dart';
import 'package:flutter_application_1/loading.dart';
import 'firebase_options.dart';
import 'auth/login_screen.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [Locale('en', ''), Locale('pl', '')],
    onGenerateTitle: (BuildContext context) =>
        AppLocalizations.of(context)!.appTitle,
    theme: ThemeData(
      primarySwatch: Colors.amber,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: App(),
  ));
}

class App extends StatelessWidget {
  App({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorPage(
            errorMessage: snapshot.error.toString(),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder<User?>(
            stream: auth.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final User? user = snapshot.data;
                if (user == null) {
                  return LoginScreen();
                }
                return const HomePage();
              }
              return const Loading();
            },
          );
        }

        return const Loading();
      },
    );
  }
}
