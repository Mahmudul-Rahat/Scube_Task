import 'package:flutter/cupertino.dart';
import 'package:scube_task/constant/image.dart';
import 'package:scube_task/widget/data_card.dart';

class SourceTab extends StatelessWidget {
  const SourceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataCard(
            title: 'Data View',
            isActive: true,
            data1: 55505.633,
            data2: 58805.63,
            image: AppImage.solar,
          ),
          SizedBox(height: 16),
          DataCard(
            title: 'Data Type 2',
            isActive: true,
            data1: 12345.67,
            data2: 98765.43,
            image: AppImage.tower,
          ),
          SizedBox(height: 16),
          DataCard(
            title: 'Data Type 3',
            isActive: false,
            data1: 33333.33,
            data2: 44444.44,
            image: AppImage.volt,
          ),
        ],
      ),
    );
  }
}











class LoadTab extends StatelessWidget {
  const LoadTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: const Text('This is the load tab'));
  }
}

