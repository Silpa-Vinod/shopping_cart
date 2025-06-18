import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../widgets/action_buttons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.profile),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.homeScreen);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding:  EdgeInsets.symmetric(
                  horizontal: AppConstants.sixteen),
              child: Column(
                children: [
                   SizedBox(height: AppConstants.twentyFour),
                  _buildProfileHeader(),
                   SizedBox(height: AppConstants.twentyFour),
                  _buildProfileTile(
                    icon: Icons.shopping_bag,
                    title: AppConstants.cart,
                    onTap: () {},
                  ),
                  _buildProfileTile(
                    icon: Icons.location_on,
                    title: AppConstants.addressText,
                    subtitle: AppConstants.address,
                    onTap: () {},
                  ),
                  _buildProfileTile(
                    icon: Icons.favorite,
                    title: AppConstants.wishlist,
                    onTap: () {},
                  ),
                  _buildProfileTile(
                    icon: Icons.settings,
                    title: AppConstants.settings,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(AppConstants.sixteen),
            child: ActionButton(
              label: AppConstants.logout,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.onboarding,
                      (route) => false,
                );
              },
              labelColor: Colors.white,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: AppConstants.forty,
          backgroundColor: Colors.green.shade200,
          child:  Icon(Icons.person,
              size: AppConstants.forty, color: Colors.white),
        ),
         SizedBox(height: AppConstants.twelve),
         Text(
          AppConstants.userName,
          style: TextStyle(
            fontSize: AppConstants.twentyFour,
            fontWeight: FontWeight.bold,
          ),
        ),
         Text(
          AppConstants.email,
          style: TextStyle(
            fontSize: AppConstants.forTeen,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      subtitle: subtitle != null
          ? Text(subtitle,
          style: TextStyle(fontSize: AppConstants.twelve))
          : null,
      trailing: Icon(Icons.arrow_forward_ios,
          size: AppConstants.sixteen),
      onTap: onTap,
    );
  }
}
