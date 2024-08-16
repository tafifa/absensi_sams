import 'package:flutter/material.dart';

import '../features/attendance_history/attendance_history.dart';

class PreviewAttendanceHistory extends StatelessWidget {
  const PreviewAttendanceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Riwayat Absensi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            InkWell(
              onTap: () {
                // Navigate to the Attendance History page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AttendanceHistoryPage()),
                );
              },
              child: Text('Show more', style: TextStyle(fontSize: 14, color: Colors.blue)),
            ),
          ],
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Allows horizontal scrolling
          child: Row(
            children: [
              HistoryItem(date: '25 Jul 2024', checkIn: '08:01', checkOut: '16:55'),
              SizedBox(width: 8), // Add some spacing between items
              HistoryItem(date: '24 Jul 2024', checkIn: '08:01', checkOut: '16:55'),
              SizedBox(width: 8),
              HistoryItem(date: '23 Jul 2024', checkIn: '08:04', checkOut: '16:53'),
              SizedBox(width: 8),
              HistoryItem(date: '22 Jul 2024', checkIn: '08:04', checkOut: '16:53'),
            ],
          ),
        ),
      ],
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String date;
  final String checkIn;
  final String checkOut;

  const HistoryItem({
    super.key,
    required this.date,
    required this.checkIn,
    required this.checkOut,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Fixed width to make scrolling more effective
      height: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.lightGreen[600],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(date, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 8),
          Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.login, size: 14, color: Colors.white70),
                  const SizedBox(width: 4),
                  Text('In: $checkIn', style: const TextStyle(fontSize: 14, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.logout, size: 14, color: Colors.white70),
                  const SizedBox(width: 4),
                  Text('Out: $checkOut', style: const TextStyle(fontSize: 14, color: Colors.white)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
