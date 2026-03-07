import 'dart:async';

import 'package:flutter/material.dart';

const Color kBlue = Color(0xFF1877F2);
const Color kWhite = Color(0xFFFFFFFF);
const Color kGray = Color(0xFF898F9C);
const Color kBlack = Color(0xFF242527);
const Color kError = Color(0xFFEE403D);

void main() {
  runApp(const FacebookTaskApp());
}

class FacebookTaskApp extends StatelessWidget {
  const FacebookTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Task',
      theme: ThemeData(
        scaffoldBackgroundColor: kWhite,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Image.asset('facebook/App Rounded Logo.png', width: 72, height: 72),
            const Spacer(),
            const Text(
              'From',
              style: TextStyle(color: kGray, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 4),
            Image.asset('facebook/Meta Logo.png', width: 95),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Column(
          children: [
            const _HomeAppBar(),
            const Divider(height: 1, color: Color(0xFFC9CDD6)),
            const _MindRow(),
            const Divider(height: 1, color: Color(0xFFC9CDD6)),
            const _StoriesSection(),
            const Divider(height: 1, color: Color(0xFFC9CDD6)),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  _FeedPost(),
                  SizedBox(height: 8),
                  Divider(height: 1, color: Color(0xFFE3E6ED)),
                  SizedBox(height: 8),
                  _FeedPost(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Facebook',
                style: TextStyle(
                  color: kBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              _ActionCircle(icon: Icons.add, filled: true),
              const SizedBox(width: 10),
              const Icon(Icons.search, color: kBlack, size: 28),
              const SizedBox(width: 10),
              _ActionCircle(icon: Icons.chat, filled: true),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _TopTab(icon: Icons.home, active: true),
              const _TopTab(icon: Icons.ondemand_video_outlined),
              const _TopTab(icon: Icons.storefront_outlined),
              const _TopTab(icon: Icons.account_circle_outlined),
              const _TopTab(icon: Icons.notifications_none),
              CircleAvatar(
                radius: 15,
                backgroundImage: const AssetImage('Images/096ff7fd728e880bca931a69a1417a5f.jpg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionCircle extends StatelessWidget {
  const _ActionCircle({required this.icon, this.filled = false});

  final IconData icon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: filled ? kBlack : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: filled ? kWhite : kBlack, size: 17),
    );
  }
}

class _TopTab extends StatelessWidget {
  const _TopTab({required this.icon, this.active = false});

  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      child: Column(
        children: [
          Icon(icon, color: active ? kBlue : kGray, size: 29),
          const SizedBox(height: 6),
          Container(
            height: 2,
            color: active ? kBlue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class _MindRow extends StatelessWidget {
  const _MindRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('Images/096ff7fd728e880bca931a69a1417a5f.jpg'),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              "What's in Your Mind?",
              style: TextStyle(fontSize: 16, color: kGray, fontWeight: FontWeight.w400),
            ),
          ),
          Icon(Icons.image_outlined, color: Colors.green.shade500, size: 28),
        ],
      ),
    );
  }
}

class _StoriesSection extends StatelessWidget {
  const _StoriesSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        scrollDirection: Axis.horizontal,
        children: const [
          _CreateStoryCard(),
          SizedBox(width: 8),
          _StoryCard(
            imagePath: 'Images/429820590_791043733050594_2437304548159507703_n.jpg',
            userImagePath: 'Images/model4.jpg',
          ),
          SizedBox(width: 8),
          _StoryCard(
            imagePath: 'Images/model2.jpg',
            userImagePath: 'Images/096ff7fd728e880bca931a69a1417a5f.jpg',
          ),
          SizedBox(width: 8),
          _StoryCard(
            imagePath: 'Images/image4.jpg',
            userImagePath: 'Images/model3.jpg',
          ),
        ],
      ),
    );
  }
}

class _CreateStoryCard extends StatelessWidget {
  const _CreateStoryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD2D6DF)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    'Images/096ff7fd728e880bca931a69a1417a5f.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                const Positioned(
                  bottom: -14,
                  left: 46,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: kBlue,
                    child: Icon(Icons.add, color: kWhite, size: 20),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Create a\nStory',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: kBlack, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({required this.imagePath, required this.userImagePath});

  final String imagePath;
  final String userImagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 124,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: kBlue, width: 2),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(backgroundImage: AssetImage(userImagePath)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('Images/429820590_791043733050594_2437304548159507703_n.jpg'),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Route', style: TextStyle(fontSize: 18, color: kBlack, fontWeight: FontWeight.bold)),
              SizedBox(height: 3),
              Row(
                children: [
                  Text('8h', style: TextStyle(fontSize: 16, color: kGray)),
                  SizedBox(width: 4),
                  Icon(Icons.public, size: 16, color: kGray),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.more_horiz, color: kBlack, size: 30),
        ],
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      width: double.infinity,
      height: 390,
      alignment: Alignment.center,
      child: Image.asset(
        'Images/394207767_709508957870739_4789263993603935944_n.jpg',
        fit: BoxFit.contain,
        width: double.infinity,
        height: 380,
      ),
    );
  }
}

class _PostActions extends StatelessWidget {
  const _PostActions();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 2, 16, 10),
      child: Row(
        children: [
          Icon(Icons.favorite_border, color: kBlack, size: 25),
          SizedBox(width: 12),
          Icon(Icons.mode_comment_outlined, color: kBlack, size: 25),
          SizedBox(width: 12),
          Icon(Icons.send_outlined, color: kBlack, size: 25),
          Spacer(),
          Icon(Icons.bookmark_border, color: kBlack, size: 25),
        ],
      ),
    );
  }
}

class _FeedPost extends StatelessWidget {
  const _FeedPost();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _PostHeader(),
        _PostImage(),
        _PostActions(),
      ],
    );
  }
}


