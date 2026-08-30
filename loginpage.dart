import 'package:flutter/material.dart';
import 'package:flutter_application_1/signuppage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
 final formKey = GlobalKey<FormState>();
 
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
 
  bool passwordVisible = false;
 
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
 
  String? usernameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter your username';
    }
 
    if (value.trim().length < 3) {
      return 'Username must be at least 3 characters';
    }
 
    return null;
  }
 
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your password';
    }
 
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
 
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Add one uppercase letter';
    }
 
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Add one lowercase letter';
    }
 
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Add one number';
    }
 
    return null;
  }
 
  InputDecoration decoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.white70,
        fontSize: 13,
      ),
      filled: true,
      fillColor: Colors.black,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 15,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Color(0xFFFF0066),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Color(0xFFFF0066),
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    );
  }
 
  void login() {
    if (formKey.currentState!.validate()) {
      String username = usernameController.text.trim();
 
      print('Username: $username');
 
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged in successfully'),
        ),
      );
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
 
                Image(image: AssetImage("assets/logo1.jpg")),
 
                const SizedBox(height: 1),
 
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'LogIn into your ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Account',
                        style: TextStyle(
                          color: Color(0xFFFF0066),
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
 
                const SizedBox(height: 28),
 
                TextFormField(
                  controller: usernameController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  validator: usernameValidator,
                  decoration: decoration(
                    'Enter your username',
                  ),
                ),
 
                const SizedBox(height: 20),
 
                TextFormField(
                  controller: passwordController,
                  obscureText: !passwordVisible,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  validator: passwordValidator,
                  decoration: decoration(
                    'Enter your Password',
                  ).copyWith(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
 
                const SizedBox(height: 30),
 
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD91B59),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
 
                const SizedBox(height: 25),
 
                const Text(
                  'Log In With:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
 
                const SizedBox(height: 15),
 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Text(
                        'G',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
 
                    const SizedBox(width: 22),
 
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: Color(0xFF4267B2),
                      child: Icon(
                        Icons.facebook,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
 
                    const SizedBox(width: 22),
 
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: Color(0xFFD71939),
                      child: Text(
                        'P',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
 
                const SizedBox(height: 20),
 
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Color(0xFFFF0066),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
 
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
