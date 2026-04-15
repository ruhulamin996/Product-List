import 'package:crafty_bay/features/provider/language_provider.dart';
import 'package:crafty_bay/features/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/screens/sign_up_Screen.dart';
import 'package:crafty_bay/features/screens/splash_screen.dart';
import 'package:crafty_bay/features/screens/verify_otp_screen.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:crafty_bay/main/app_theme.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'main/theme_controller.dart';
import 'main/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (!kIsWeb) {
    FlutterError.onError =
        FirebaseCrashlytics.instance.recordFlutterError;

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance
          .recordError(error, stack, fatal: true);
      return true;
    };
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageProvider()..changeLanguage(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeController>(context);

    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          title: 'Crafty Bay',
          debugShowCheckedModeBanner: false,

          /// ✅ Theme
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.isDark
              ? ThemeMode.dark
              : ThemeMode.light,

          /// ✅ Localization
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('bn'),
          ],
          locale: languageProvider.currentLocale,

          initialRoute: '/',
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            SignInScreen.routeName: (context) => const SignInScreen(),
            VerifyOtpScreen.routeName: (context) => const VerifyOtpScreen(),
            
          }
        );
      },
    );
  }
}
