import 'package:flutter/material.dart';

import '../constants.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _emailTouched = false;
  bool _passwordTouched = false;
  bool _obscurePassword = true;

  static final RegExp _emailPattern = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  static final RegExp _passwordPattern = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z\d]).{8,}$',
  );

  bool get _emailValid => _emailPattern.hasMatch(_emailController.text.trim());
  bool get _passwordValid => _passwordPattern.hasMatch(_passwordController.text);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    setState(() {
      _emailTouched = true;
      _passwordTouched = true;
    });

    if (_emailValid && _passwordValid) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showEmailError = _emailTouched && !_emailValid;
    final bool showPasswordError = _passwordTouched && !_passwordValid;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 78),
              Image.asset('facebook/App Rounded Logo.png', width: 82, height: 82),
              const SizedBox(height: 58),
              _InputField(
                controller: _emailController,
                hint: 'Mobile Number or Email address',
                keyboardType: TextInputType.emailAddress,
                errorText: showEmailError ? 'Invalid Email' : null,
                onChanged: (_) {
                  if (!_emailTouched) _emailTouched = true;
                  setState(() {});
                },
              ),
              const SizedBox(height: 12),
              _InputField(
                controller: _passwordController,
                hint: 'Password',
                obscureText: _obscurePassword,
                suffix: IconButton(
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: kGray,
                  ),
                ),
                errorText: showPasswordError
                    ? 'Password must include upper, lower, number, special character'
                    : null,
                onChanged: (_) {
                  if (!_passwordTouched) _passwordTouched = true;
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onLoginPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlue,
                    foregroundColor: kWhite,
                    elevation: 0,
                    overlayColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgotten Password ?',
                  style: TextStyle(fontSize: 16, color: kGray, fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: kBlue,
                    side: const BorderSide(color: kBlue, width: 1.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Image.asset('facebook/Meta Logo.png', width: 100),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.hint,
    required this.onChanged,
    this.errorText,
    this.obscureText = false,
    this.keyboardType,
    this.suffix,
  });

  final TextEditingController controller;
  final String hint;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final bool hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          cursorColor: kBlue,
          onChanged: onChanged,
          style: const TextStyle(fontSize: 16, color: kBlack, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 16, color: kGray, fontWeight: FontWeight.w400),
            filled: true,
            fillColor: const Color(0xFFF0F2F7),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            suffixIcon: suffix,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: hasError ? kError : kGray, width: hasError ? 2 : 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: hasError ? kError : kBlue, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: kError, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: kError, width: 2),
            ),
            errorStyle: const TextStyle(height: 0, fontSize: 0),
            errorText: hasError ? ' ' : null,
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 6),
            child: Text(errorText!, style: const TextStyle(color: kError, fontSize: 14)),
          ),
      ],
    );
  }
}
