import 'package:flutter/material.dart';
import '../../cart_services.dart';
import '../../constants/constants.dart';
import '../../data/models/model.dart';
import '../widgets/widgets.dart';

class CartWishListScreen extends StatelessWidget {
  final bool isFrom;

  const CartWishListScreen({super.key, required this.isFrom});

  @override
  Widget build(BuildContext context) {
    final List<CartItem> cartItems = isFrom
        ? CartService.getCartItems()
        : [
            CartItem(
                imagePath: 'lib/assets/images/iphone_black.png',
                title: 'IPHONE',
                price: 100000,
                shipping: 'Free Shipping',
                groupId: 'phone'),
            CartItem(
                imagePath: 'lib/assets/images/smart_tv_one.png',
                title: 'Samsung 80 cm',
                price: 14490,
                shipping: 'Shipping Cost 200',
                groupId: 'tv'),
          ];

    return Scaffold(
      appBar: AppBar(
        title: Text(isFrom ? AppConstants.myCart : AppConstants.wishlist),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.homeScreen);
          },
        ),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text(AppConstants.noData))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(AppConstants.sixteen),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return _buildCartItemCard(cartItems[index]);
                    },
                  ),
                ),
                if (isFrom)
                  Padding(
                    padding: EdgeInsets.all(AppConstants.sixteen),
                    child: ActionButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.checkOut,
                          arguments: cartItems
                              .map((c) => Product(
                                  name: c.title,
                                  price: c.price,
                                  shipping: c.shipping,
                                  imagePath: c.imagePath,
                                  groupId: c.groupId))
                              .toList(),
                        );
                      },
                      label: AppConstants.buyNow,
                      labelColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _buildCartItemCard(CartItem item) {
    return Card(
      color: Colors.greenAccent[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.twelve),
      ),
      elevation: AppConstants.four,
      margin: EdgeInsets.only(bottom: AppConstants.eight),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.twelve),
        child: Row(
          children: [
            Image.asset(
              item.imagePath,
              height: AppConstants.eighty,
              width: AppConstants.eighty,
            ),
            SizedBox(width: AppConstants.sixteen),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      txt: item.title,
                      weight: FontWeight.bold,
                      size: AppConstants.sixteen,
                      color: Colors.black),
                  SizedBox(height: AppConstants.eight),
                  TextView(
                      txt: "₹ ${item.price.toStringAsFixed(2)}",
                      weight: FontWeight.normal,
                      size: AppConstants.forTeen,
                      color: Colors.black),
                  SizedBox(height: AppConstants.eight),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppConstants.twelve),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: AppConstants.four,
                      horizontal: AppConstants.eight,
                    ),
                    child: TextView(
                      txt: item.shipping,
                      weight: FontWeight.normal,
                      size: AppConstants.forTeen,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
