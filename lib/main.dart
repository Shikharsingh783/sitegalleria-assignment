import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sitegalleria/models/data.dart';
import 'package:sitegalleria/screens/test_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Data(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins"),
      home: SolarSystemWithPartialRings(),
    );
  }
}
