import 'package:flutter/material.dart';
import 'profile.dart';
import 'widgets/flex_box.dart';
import 'dart:ui';
import 'widgets/dashed_line.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _tutorialStep = 0;
  bool _showTutorial = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Logo at the top-left corner
          Positioned(
            top: 40,
            left: 20,
            child: Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
          ),
          // Settings button at the top-right corner
          Positioned(
            top: 65,
            right: 20,
            child: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
            ),
          ),
          // Flex boxes with common heading
          const Positioned(
            top: 160,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'প্রাথমিক শিক্ষা',
                  style: TextStyle(
                    fontFamily: 'Ador Noirrit',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FlexBox(
                        text: 'বাংলা',
                        progress: 0.5,
                      ),
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: FlexBox(
                        text: 'ইংরেজি',
                        progress: 0.7,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FlexBox(
                        text: 'গনিত',
                        progress: 0.3,
                      ),
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: FlexBox(
                        text: 'বিজ্ঞান',
                        progress: 0.9,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  'কারিগরি শিক্ষা',
                  style: TextStyle(
                    fontFamily: 'Ador Noirrit',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FlexBox(
                        text: 'সেলাই',
                        progress: 0.5,
                      ),
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: FlexBox(
                        text: 'নার্সিং',
                        progress: 0.7,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FlexBox(
                        text: 'মেকাপ আর্টিস্ট',
                        progress: 0.3,
                      ),
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: FlexBox(
                        text: 'ইলেক্ট্রো মেকানিকাল টেকনিশিয়ান',
                        progress: 0.9,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Replace the existing tutorial Stack with this updated version
          if (_showTutorial)
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_tutorialStep < 1) {
                    _tutorialStep++;
                  } else {
                    _showTutorial = false;
                  }
                });
              },
              child: Stack(
                children: [
                  // Transparent hole for the makeup artist box
                  ClipPath(
                    clipper: BoxClipper(
                      holeRect: Rect.fromLTWH(20, 565, (MediaQuery.of(context).size.width - 55) / 2, 80),
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  // Dashed lines
                  DashedLine(tutorialStep: _tutorialStep),
                  Stack(
                    children: [
                      // Tutorial image
                      Positioned(
                        top: 329,
                        left: 92,
                        child: Image.asset(
                          'assets/images/tutorial.png',
                          width: 268,
                          height: 459,
                        ),
                      ),
                      // Tutorial text box
                      Positioned(
                        top: 415,
                        left: 135,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          width: 200, // Fixed width for text box
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            _tutorialStep == 0
                                ? 'কোর্সটি ডাউনলোড করতে চাইলে এখানে ক্লিক করো'
                                : 'তোমার অগ্রগতি এখানে দেখতে পারবে',
                            textAlign: TextAlign.center, // Add this line to center the text
                            style: const TextStyle(
                              fontFamily: 'Ador Noirrit',
                              fontSize: 16,
                              color: Colors.black,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class BoxClipper extends CustomClipper<Path> {
  final Rect holeRect;

  BoxClipper({required this.holeRect});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    
    final roundedRect = RRect.fromRectAndRadius(
      holeRect,
      const Radius.circular(12),
    );
    
    path.addRRect(roundedRect);
    path.fillType = PathFillType.evenOdd;
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
