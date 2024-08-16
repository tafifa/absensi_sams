import 'package:absensi_sams/src/widgets/attendance_info.dart';
import 'package:absensi_sams/src/widgets/attendance_todo.dart';
import 'package:absensi_sams/src/widgets/preview_attendance_history.dart';
import 'package:absensi_sams/src/widgets/quick_menu.dart';
import 'package:flutter/material.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuickMenu(),
            SizedBox(height: 16),
            AttendanceInfo(),
            SizedBox(height: 16),
            AttendanceTodo(),
            SizedBox(height: 16),
            PreviewAttendanceHistory(),

          ],
        ),
      ),
    );
  }
}