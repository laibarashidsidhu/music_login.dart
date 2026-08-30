import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginpage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    numberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter your email';
    }

    if (!RegExp(
      r'^[\w.-]+@[\w.-]+\.[A-Za-z]{2,}$',
    ).hasMatch(value.trim())) {
      return 'Enter a valid email';
    }

    return null;
  }

  String? numberValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter your number';
    }

    if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value.trim())) {
      return 'Enter a valid number';
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

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm your password';
    }

    if (value != passwordController.text) {
      return 'Passwords do not match';
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

  void signup() {
    if (formKey.currentState!.validate()) {
      String username = usernameController.text.trim();
      String email = emailController.text.trim();
      String number = numberController.text.trim();

      print('Username: $username');
      print('Email: $email');
      print('Number: $number');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully'),
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
                        text: 'Sign Up your ',
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  validator: emailValidator,
                  decoration: decoration(
                    'Enter your Email',
                  ),
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: numberController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  validator: numberValidator,
                  decoration: decoration(
                    'Enter your Number',
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

                const SizedBox(height: 20),

                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: !confirmPasswordVisible,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  validator: confirmPasswordValidator,
                  decoration: decoration(
                    'Confirm Password',
                  ).copyWith(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          confirmPasswordVisible =
                              !confirmPasswordVisible;
                        });
                      },
                      icon: Icon(
                        confirmPasswordVisible
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
                    onPressed: signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD91B59),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

              InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Loginpage()),
    );
  },
  borderRadius: BorderRadius.circular(8),
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Text(
      'OR login',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  ),
),

                const SizedBox(height: 25),

                const Text(
                  'Sign Up With:',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}