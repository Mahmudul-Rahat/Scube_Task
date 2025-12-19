import 'package:flutter/material.dart';

class IconElevatedButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onPressed;

  const IconElevatedButton({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical:4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.white
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonItem {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  ButtonItem({
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

}

