import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scube_task/constant/colors.dart';
import 'package:scube_task/constant/image.dart';

class RevenueView extends StatelessWidget {
  const RevenueView({super.key});


  @override
  Widget build(BuildContext context) {
    bool _isExpanded = false;
    return  Column(
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
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ExpansionTile(
              leading: Image.asset(AppImage.graphIcon,height: 30,width: 30,),
              title: const Text(
                'Data & Cost Info',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade50,
                ),
                child: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
              backgroundColor: Colors.transparent,
              collapsedBackgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.grey),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDataItem( 'Data 1','2798.50 (29.53%)', 'Cost 1', '35689 t'),
                      SizedBox(height: 8),
                      _buildDataItem('Data 2', '2798.50 (29.53%)', 'Cost 2', '35689 t'),
                      SizedBox(height: 8),

                      _buildDataItem('Data 3', '2798.50 (29.53%)', 'Cost 3', '35689 t'),
                      SizedBox(height: 8),

                      _buildDataItem('Data 4', '2798.50 (29.53%)', 'Cost 4', '35689 t'),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildDataItem(String dataNumber,String data,String costNumber, String cost,) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(shape: BoxShape.circle),
          margin: const EdgeInsets.only(right: 12),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Row(
                children: [
                  Text('$dataNumber: ', style: const TextStyle(color: Colors.grey)),
                  Text(data, style: const TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
              Row(
                children: [
                  Text('$costNumber: ', style: TextStyle(color: Colors.grey)),
                  Text(cost, style: const TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}