import 'package:flutter/material.dart';
import 'package:sitegalleria/components/my_Textfeild.dart';
import 'package:sitegalleria/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            //row 1
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  //back icon
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  //text
                  const Text(
                    'Premium Reports',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),

                  // Icon()
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Browse our Premium Reports',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            ///feild
            MyTextfeild(),
          ],
        ),
      ),
    );
  }
}
