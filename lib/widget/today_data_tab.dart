import 'package:flutter/material.dart';

class TodayDataTab extends StatelessWidget {
  const TodayDataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Energy Chart text
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Energy Chart',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        Text(
                          '5.53 KW',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                  // Cards
                  _buildDataCard('Data A', Colors.blue, '2798.50 (29.53%)', '35689 ৳'),
                  const SizedBox(height: 8),
                  _buildDataCard('Data B', Colors.blueAccent, '72598.50 (35.39%)', '5259689 ৳'),
                  const SizedBox(height: 8),
                  _buildDataCard('Data C', Colors.purple, '6598.36 (83.90%)', '5698756 ৳'),
                  const SizedBox(height: 8),
                  _buildDataCard('Data D', Colors.orange, '6598.26 (36.59%)', '356987 ৳'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataCard(String title, Color dotColor, String data, String cost) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 8, width: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor)),
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const VerticalDivider(indent: 10, endIndent: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text('Data', style: TextStyle(color: Colors.grey.shade600)),
                  const SizedBox(width: 12),
                  Text(':$data', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  Text('Cost', style: TextStyle(color: Colors.grey.shade600)),
                  const SizedBox(width: 12),
                  Text(':$cost', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
