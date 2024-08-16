import 'package:flutter/material.dart';

class AttendanceHistoryPage extends StatelessWidget {
  const AttendanceHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data
    final attendanceData = [
      {'date': '15/6/2024', 'status': 'present', 'number': '2024/VI/15'},
      {'date': '15/6/2024', 'status': 'absent', 'number': '2024/VI/15'},
      {'date': '15/6/2024', 'status': 'leave', 'number': '2024/VI/15'},
      {'date': '15/6/2024', 'status': 'present', 'number': '2024/VI/15'},
      {'date': '15/6/2024', 'status': 'present', 'number': '2024/VI/15'},
      {'date': '15/6/2024', 'status': 'present', 'number': '2024/VI/15'},
      {'date': '15/6/2024', 'status': 'absent', 'number': '2024/VI/15'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Izin/Cuti'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Non-const Icon
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                DropdownButton<String>(
                  items: <String>['By Date', 'By Status'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                  value: 'By Date',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: attendanceData.length,
                itemBuilder: (context, index) {
                  final item = attendanceData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: getStatusColor(item['status']!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 80,
                            decoration: BoxDecoration(
                              color: getStatusColor(item['status']!),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item['date']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'nomor surat/${item['number']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add action
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'present':
        return Colors.green;
      case 'absent':
        return Colors.red;
      case 'leave':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}