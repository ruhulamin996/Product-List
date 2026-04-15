import 'package:crafty_bay/features/screens/sign_up_Screen.dart';
import 'package:crafty_bay/features/widget/app_logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeController>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Spacer(),
              AppLogo(width: 100, height: null,),
              Spacer(),
              CircularProgressIndicator(),
              const SizedBox(height: 20)


              // Text(AppLocalizations.of(context)!.hello),
              // LanguageSelector(),
              // Switch(
              //     value: themeProvider.isDark,
              //     onChanged: (value){
              //       themeProvider.toggleTheme(value);
              //     }
              // ),
            ]
          ),
        )
      ),
    );
  }
}
