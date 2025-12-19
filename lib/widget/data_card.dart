import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scube_task/constant/colors.dart';

class DataCard extends StatelessWidget {
  final String title;
  final bool isActive;
  final double data1;
  final double data2;
  final String image;

  const DataCard({
    super.key,
    required this.title,
    required this.isActive,
    required this.data1,
    required this.data2,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50 ,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: (){
          context.push('/data');
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Center(
                child: Image.asset(
                  image,
                  height: 24,
                  width: 24,
                ),
              ),
        
              const SizedBox(width: 12),
        
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: isActive ? AppColors.primaryColor : Colors.orange,
                            borderRadius: BorderRadius.circular(2)
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isActive ? '(Active)' : '(Inactive)',
                          style: TextStyle(
                            fontSize: 14,
                            color: isActive ? AppColors.primaryColor : Colors.orange,
                          ),
                        ),
                      ],
                    ),
        
                    const SizedBox(height: 4),
        
        
                    Text(
                      'Data 1 : ${data1.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
        
                    const SizedBox(height: 2),
        
        
                    Text(
                      'Data 2 : ${data2.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
        
        
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

