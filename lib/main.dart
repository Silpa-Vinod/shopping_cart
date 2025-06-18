import 'package:flutter/material.dart';
import 'package:shopping_cart/routes.dart';
import 'constants/constants.dart';


void main() {
  runApp(const CyberLinioApp());
}

class CyberLinioApp extends StatelessWidget {
  const CyberLinioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppConstants.cyberLinio,
      initialRoute: RouteNames.onboarding,
      onGenerateRoute: Routes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
