import 'package:flutter/material.dart';
import 'package:sitegalleria/const.dart';

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Color2,
            Color1,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1), // Subtler glow effect
            spreadRadius: 1, // Reduced spread
            blurRadius: 10, // Slightly less blur for subtlety
            offset:
                const Offset(3, 3), // Adjusted offset for better positioning
          ),
        ],
      ),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Purchase',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Image(
              image: AssetImage('assets/images/fi-br-shopping-cart.png'),
              height: 16,
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
