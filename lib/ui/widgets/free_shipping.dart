import 'package:flutter/material.dart';
import 'package:shopping_cart/constants/app_constants.dart';

class FreeShipping extends StatelessWidget {
  final String shipping;
  const FreeShipping({super.key, required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
            AppConstants.twelve), // Rounded corners
      ),
      padding:  EdgeInsets.symmetric(
          vertical: AppConstants.four,
          horizontal:
          AppConstants.twelve), // Padding inside the container
      child: Text(
        shipping,
        style:  TextStyle(
          fontSize: AppConstants.forTeen,
          color: const Color(0xff16a34a),
        ),
      ),
    );
  }
}
