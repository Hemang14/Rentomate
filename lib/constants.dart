import 'package:flutter/material.dart';

import 'model/user_model.dart';

// Color mPrimaryColor = Color(0xFF811B83);
//
// Color mTitleTextColor = Color(0xFF100E34);
//
// Color mBodyTextColor = Color(0xFF100E34).withOpacity(0.5);
//
// Color mBackgroundColor = Color(0xFFF5F6F6);
//
// Color mSecondaryColor = Color(0xFFFA5019);
//
// final categoryList = ['Top Recommended', 'Near you', 'College Recommended'];

final recommendedList = [
  House('The Jerry Pg', '2nd Cross, Hanumanth nagar',
      'assets/images/house01.jpeg', '₹10,000','Mr. Krishna Reddy'),
  House('The Thomas Pg', '3rd Cross, Banashankari Stage-1',
      'assets/images/house02.jpeg','₹11,000','Mr. Ram Chandra'),
  House('The Noddy Pg', '4th Cross, Banashankari Stage-1',
      'assets/images/house03.jpeg','₹12,000','Mrs. Sushma Devi '),
  House('The Panther Pg', '5th Cross, Banashankari Stage-1',
      'assets/images/house04.jpeg','₹13,000','Mr. Kanha Gupta'),
  House('The Rancho Pg', '6th Cross, Banashankari Stage-1',
      'assets/images/house05.jpeg','₹14,000','Mr. Kanjilal N'),
  House('The Aloha Pg', '7th Cross, Hanumanth nagar',
      'assets/images/house01.jpeg','₹15,000','Mrs. Sonia Sharma'),
  House('The Giyan Pg', '8th Cross, Banashankari Stage-1',
      'assets/images/house02.jpeg','₹16,000','Mr. Romeo Chauhan'),
  House('The Nobita Pg', '9th Cross, Banashankari Stage-1',
      'assets/images/house03.jpeg','₹17,000','Mrs. Juliet Shetty '),
  House('The Sunio Pg', '10th Cross, Banashankari Stage-1',
      'assets/images/house04.jpeg','₹18,000','Mr. Sita Ram'),
  House('The Degi Pg', '11th Cross, Banashankari Stage-1',
      'assets/images/house05.jpeg','₹19,000','Mr. Singham Rowdy'),
  House('The Yash Pg', '12nd Cross, Hanumanth nagar',
      'assets/images/house01.jpeg','₹20,000','Mr. Tata Birla'),
  House('The Ferb Pg', '13th Cross, Banashankari Stage-1',
      'assets/images/house02.jpeg','₹21,000','Mr. Samsun R'),
  House('The phineas Pg', '14th Cross, Banashankari Stage-1',
      'assets/images/house03.jpeg','₹22,000','Mr. Kothilal Meheta'),
  House('The Shinchan Pg', '15th Cross, Banashankari Stage-1',
      'assets/images/house04.jpeg','₹23,000','Mr. Kanta Bai'),
  House('The  Shawn Pg', '16th Cross, Banashankari Stage-1',
      'assets/images/house05.jpeg','₹24,000','Mr. Meheta '),
];

final bestofferList = [
  House('The Jerry Pg', '2nd Cross, Hanumanth nagar',
      'assets/images/house01.jpeg', '₹10,000','Mr. Krishna Reddy'),
  House('The Thomas Pg', '3rd Cross, Banashankari Stage-1',
      'assets/images/house02.jpeg','₹11,000','Mr. Ram Chandra'),
  House('The Noddy Pg', '4th Cross, Banashankari Stage-1',
      'assets/images/house03.jpeg','₹12,000','Mrs. Sushma Devi '),
  House('The Panther Pg', '5th Cross, Banashankari Stage-1',
      'assets/images/house04.jpeg','₹13,000','Mr. Kanha Gupta'),
  House('The Rancho Pg', '6th Cross, Banashankari Stage-1',
      'assets/images/house05.jpeg','₹14,000','Mr. Kanjilal N'),
  House('The Aloha Pg', '7th Cross, Hanumanth nagar',
      'assets/images/house01.jpeg','₹15,000','Mrs. Sonia Sharma'),
  House('The Giyan Pg', '8th Cross, Banashankari Stage-1',
      'assets/images/house02.jpeg','₹16,000','Mr. Romeo Chauhan'),
  House('The Nobita Pg', '9th Cross, Banashankari Stage-1',
      'assets/images/house03.jpeg','₹17,000','Mrs. Juliet Shetty '),
  House('The Sunio Pg', '10th Cross, Banashankari Stage-1',
      'assets/images/house04.jpeg','₹18,000','Mr. Sita Ram'),
  House('The Degi Pg', '11th Cross, Banashankari Stage-1',
      'assets/images/house05.jpeg','₹19,000','Mr. Singham Rowdy'),
  House('The Yash Pg', '12nd Cross, Hanumanth nagar',
      'assets/images/house01.jpeg','₹20,000','Mr. Tata Birla'),
  House('The Ferb Pg', '13th Cross, Banashankari Stage-1',
      'assets/images/house02.jpeg','₹21,000','Mr. Samsun R'),
  House('The phineas Pg', '14th Cross, Banashankari Stage-1',
      'assets/images/house03.jpeg','₹22,000','Mr. Kothilal Meheta'),
  House('The Shinchan Pg', '15th Cross, Banashankari Stage-1',
      'assets/images/house04.jpeg','₹23,000','Mr. Kanta Bai'),
  House('The  Shawn Pg', '16th Cross, Banashankari Stage-1',
      'assets/images/house05.jpeg','₹24,000','Mr. Meheta '),
];

// final BoxShadow boxShadow = BoxShadow(
//   color: Colors.grey.withOpacity(0.3),
//   spreadRadius: 1,
//   blurRadius: 7,
//   offset: Offset(0, 3),
// );
