import 'package:crafty_bay/features/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/widget/app_logo.dart';
import 'package:crafty_bay/main/app_colors.dart';
import 'package:crafty_bay/main/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String routeName = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _nameState();
}

class _nameState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                children: [
                  AppLogo(width: 80, height: null),
                  Text(
                    'Verify OTP',
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'A 4 digits OTP has been send to your email address',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge,
                  ),
                  SizedBox(height: 10),

                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 300),
                    keyboardType: TextInputType.number,
                    showCursor: true,
                    cursorColor: AppColors.themeColor,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeColor: Colors.blue,
                      inactiveColor: AppColors.themeColor,
                      inactiveFillColor: AppColors.themeColor,
                      activeFillColor: AppColors.themeColor,
                      selectedColor: Colors.blue,
                    ),
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  FilledButton(
                    onPressed: _verifyBtn,
                    child: Text('Verify OTP'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _verifyBtn() {
    Navigator.pushReplacementNamed(context, SignInScreen.routeName);
  }
}
