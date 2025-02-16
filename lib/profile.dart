import 'package:flutter/material.dart';
import 'widgets/ranking_list.dart';
import 'data/dummy_students.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  // Function to generate initials from name
  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';
    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0];
      }
      if (initials.length >= 2) break;
    }
    return initials.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    // Sample user data - replace with actual data
    const String name = 'আব্দুল্লাহ আল মামুন';
    const String phone = '০১৭১২৩৪৫৬৭৮';
    const String age = '১০';
    const String joinDate = '০১/০১/২০২৪';

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Existing profile section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'প্রোফাইল',
                    style: TextStyle(
                      fontFamily: 'Ador Noirrit',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFFF7EDE3), // Changed from 0xFFE8F3F3 to 0xFFF7EDE3
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        // User Information
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'নামঃ $name',
                                style: TextStyle(
                                  fontFamily: 'Ador Noirrit',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'মোবাইল নম্বরঃ $phone',
                                style: TextStyle(
                                  fontFamily: 'Ador Noirrit',
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'বয়সঃ $age বছর',
                                style: TextStyle(
                                  fontFamily: 'Ador Noirrit',
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'যোগদানঃ $joinDate',
                                style: TextStyle(
                                  fontFamily: 'Ador Noirrit',
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Profile Picture with Initials
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A8088),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              getInitials(name),
                              style: const TextStyle(
                                fontFamily: 'Ador Noirrit',
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Add Ranking List
            Expanded(
              child: RankingList(
                students: dummyStudents,
                currentUserId: currentUserId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
