import 'package:flutter/material.dart';
import 'package:flutter_application_1/signuppage.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Image(image: AssetImage("assets/logo1.jpg")),

            const SizedBox(height: 30),

            Material(
              color: const Color(0xFFD91B59),
              shape: const CircleBorder(),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupPage(),
                    ),
                  );
                },
                customBorder: const CircleBorder(),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}