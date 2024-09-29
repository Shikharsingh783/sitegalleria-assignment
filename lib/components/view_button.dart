import 'package:flutter/material.dart';

class ViewButton extends StatelessWidget {
  const ViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 53,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'View',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 3,
            ),
            Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
