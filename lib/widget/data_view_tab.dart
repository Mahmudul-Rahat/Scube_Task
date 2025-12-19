import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scube_task/constant/colors.dart';
import 'package:scube_task/widget/custom_date_data.dart';
import 'package:scube_task/widget/custom_segmented_button.dart';
import 'package:scube_task/widget/today_data_tab.dart';

class DataViewTab extends StatefulWidget {
  const DataViewTab({super.key});

  @override
  State<DataViewTab> createState() => _DataViewTabState();
}

class _DataViewTabState extends State<DataViewTab> {
  int _selectedIndex = 0;
  Widget _buildSegmentedContent() {
    switch (_selectedIndex) {
      case 0:
        return  TodayDataTab();
      case 1:
        return CustomDataTab();
      default:
        return  TodayDataTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondaryColor,
              width: 16,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Power',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '5.53 KW',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        CustomSegmentedButton(
          selectedIndex: _selectedIndex,
          labels: ['Today data', 'Custom date data'],
          onChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          color:Colors.transparent,
        ),
        Expanded(child: _buildSegmentedContent())
      ],
    );
  }
}
