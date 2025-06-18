import 'package:flutter/material.dart';
import '../../assets/app_images.dart';
import '../../constants/constants.dart';
import '../widgets/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO : Image not proper ie;added green BG color
      backgroundColor: const Color(0xff16a34a),
      body: Stack(
        children: [
          Positioned.fill(
            child: AppImages().logo1,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(AppConstants.paddingEighteen),
                child: _buildActionButtons(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.homeScreen);
          },
          label: AppConstants.logIn,
          labelColor: Colors.black,
          backgroundColor: Colors.white,
        ),
         SizedBox(height: AppConstants.twelve),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.homeScreen);
          },
          child: Text(
            AppConstants.skip,
            style: TextStyle(
                color: Colors.white, fontSize: AppConstants.fontEighteen),
          ),

        ),
      ],
    );
  }

}
