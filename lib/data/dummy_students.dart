import 'dart:math';
import 'package:flutter/material.dart';
import '../models/student.dart';

final String currentUserId = 'student_15';

final List<Color> profileColors = [
  Color(0xFF2A8088),  // Teal
  Color(0xFF8B5FBF),  // Purple
  Color(0xFFE6845E),  // Coral
  Color(0xFF2E8B57),  // Sea Green
  Color(0xFF4682B4),  // Steel Blue
  Color(0xFF8B4513),  // Saddle Brown
  Color(0xFF4B0082),  // Indigo
  Color(0xFFCD5C5C),  // Indian Red
  Color(0xFF20B2AA),  // Light Sea Green
  Color(0xFFDA70D6),  // Orchid
  Color(0xFF6B8E23),  // Olive Drab
  Color(0xFF483D8B),  // Dark Slate Blue
  Color(0xFFFF6B6B),  // Light Red
  Color(0xFF008B8B),  // Dark Cyan
  Color(0xFFB8860B),  // Dark Goldenrod
  Color(0xFF9932CC),  // Dark Orchid
  Color(0xFF556B2F),  // Dark Olive Green
  Color(0xFFE9967A),  // Dark Salmon
  Color(0xFF8FBC8F),  // Dark Sea Green
  Color(0xFF9370DB),  // Medium Purple
];

final List<String> banglaNames = [
  'আব্দুল্লাহ আল মামুন',  // Current user should be first
  'রহিম উদ্দিন',
  'নাজমুল হাসান',
  'ফারহানা বেগম',
  'সাদিয়া আক্তার',
  'কামরুল হাসান',
  'জাহিদুল ইসলাম',
  'নাসরিন সুলতানা',
  'আরিফুল ইসলাম',
  'শাহানা পারভীন',
  'তানভীর আহমেদ',
  'সুমাইয়া খান',
  'মাহফুজুর রহমান',
  'শাহরিয়ার কবির',
  'তাসনিম জাহান',
  'রাফি হাসান',
  'নুসরাত জাহান',
  'আসিফ ইকবাল',
  'লাবনী আক্তার',
  'ইমরান হোসেন',
  'সাবরিনা হক',
  'মেহেদী হাসান',
  'ইসরাত জাহান',
  'তৌফিক আহমেদ',
  'নাফিসা আনজুম',
  'সাজ্জাদ হোসেন',
  'রুমানা আক্তার',
  'তানজিল হাসান',
  'নওশীন নাহার',
  'জুবায়ের আহমেদ',
  'ফারজানা আক্তার',
  'রাকিবুল হাসান',
  'সানজিদা আলম',
  'মাহমুদুল হাসান',
  'শারমিন সুলতানা',
  'শামীম রেজা',
  'নাজনীন নাহার',
  'তারিক আজিজ',
  'সামিরা জামান',
  'মোস্তাফিজুর রহমান',
  'তাহমিনা খানম',
  'সাইফুল ইসলাম',
  'রিজওয়ানা হক',
  'আল আমিন',
  'মুশফিকা জামান',
  'জাহিদ হাসান',
  'নিলুফা ইয়াসমিন',
  'আশরাফুল আলম',
  'সাবিহা নূর',
  'মাসুদ রানা'
];

final Random random = Random();

final List<Student> dummyStudents = List.generate(
  50,
  (index) => Student(
    id: 'student_$index',
    name: index == 15 ? banglaNames[0] : banglaNames[index % banglaNames.length],
    points: 4300 - (index * 30) + (random.nextInt(30)),
    profileColor: profileColors[random.nextInt(profileColors.length)],
  ),
)..sort((a, b) => b.points.compareTo(a.points));