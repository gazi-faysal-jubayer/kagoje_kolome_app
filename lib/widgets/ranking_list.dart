import 'package:flutter/material.dart';
import '../models/student.dart';
import '../utils/number_converter.dart';

class RankingList extends StatelessWidget {
  final List<Student> students;
  final String currentUserId;

  const RankingList({
    super.key,
    required this.students,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'র‍্যাংকিং প্রদর্শন',
            style: TextStyle(
              fontFamily: 'Ador Noirrit',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              final isCurrentUser = student.id == currentUserId;

              return Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: isCurrentUser ? const Color(0xFFF7EDE3) : Colors.transparent,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    // Ranking number
                    SizedBox(
                      width: 40,
                      child: _buildRankingIndicator(index, isCurrentUser),
                    ),
                    // Profile picture
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: student.profileColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          student.name.characters.first,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Name
                    Expanded(
                      child: Text(
                        student.name,
                        style: TextStyle(
                          fontFamily: 'Ador Noirrit',
                          fontSize: 16,
                          fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    // Points
                    SizedBox(
                      width: 120, // Fixed width for points section
                      child: Text(
                        BanglaNumberConverter.toBangla(student.points) + ' পয়েন্টস',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'Ador Noirrit',
                          fontSize: 16,
                          fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
                          color: const Color(0xFF2A8088),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRankingIndicator(int index, bool isCurrentUser) {
    if (index < 3) {
      String medalImage;
      double size;
      switch (index) {
        case 0:
          medalImage = 'assets/images/gold-medal.png';
          size = 32;
          break;
        case 1:
          medalImage = 'assets/images/silver-medal.png';
          size = 30;
          break;
        case 2:
          medalImage = 'assets/images/bronze-medal.png';
          size = 28;
          break;
        default:
          medalImage = 'assets/images/bronze-medal.png';
          size = 28;
      }
      return Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        child: Image.asset(
          medalImage,
          width: size,
          height: size,
          fit: BoxFit.contain,
        ),
      );
    }
    return SizedBox(
      width: 40,
      child: Text(
        BanglaNumberConverter.toBangla(index + 1),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Ador Noirrit',
          fontSize: 16,
          fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}