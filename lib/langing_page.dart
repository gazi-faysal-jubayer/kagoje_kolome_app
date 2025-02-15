import 'package:flutter/material.dart';
import 'home.dart'; // Ensure this import is correct

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Logo at the top-left corner
          Positioned(
            top: 114,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/logo.png',
              width: 220,
              height: 128,
            ),
          ),

          // Photo in the middle of the screen
          Center(
            child: Image.asset(
              'assets/images/landing.png',
              width: 328,
              height: 331,
              fit: BoxFit.cover,
            ),
          ),

          // Button at the bottom of the page
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                  backgroundColor: const Color.fromARGB(255, 148, 218, 176),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'চলো শুরু করি',
                  style: TextStyle(
                    fontFamily: 'Ador Noirrit',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}