import 'package:flutter/material.dart';
import 'package:sitegalleria/components/purchase_button.dart';
import 'package:sitegalleria/components/view_button.dart';
import 'package:sitegalleria/const.dart';
import 'package:sitegalleria/models/type.dart';

class MyServiceTile extends StatelessWidget {
  final ServiceType service;

  const MyServiceTile({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 500,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color4,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // Adjust the radius here
              child: Container(
                height: 170, // Set a fixed height
                width:
                    300, // Match the container's width to eliminate extra space
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(16), // Match the border radius
                  border: Border.all(
                      color: Colors.white,
                      width: 2), // Set the border color and width
                ),
                child: const Image(
                  image: AssetImage('assets/images/image 20.png'),
                  fit: BoxFit.fill, // Use BoxFit.cover to fill the container
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹${service.price.toString()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/fi-br-star.png'),
                      height: 20,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '${service.rating}/5.0',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color6,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              service.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              service.description,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color5,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ViewButton(),
                SizedBox(width: 6),
                PurchaseButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
