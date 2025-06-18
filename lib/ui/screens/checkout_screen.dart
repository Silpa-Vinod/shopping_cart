import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../data/models/product.dart';
import '../widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Product> products;

  const CheckoutScreen({super.key, required this.products});

  double _getShippingCost(String shipping) {
    if (shipping.toLowerCase().contains('free')) return 0.0;
    return double.tryParse(shipping.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = 0;
    double shippingTotal = 0;
    int count = 0;

    for (var p in products) {
      subtotal += p.price;
      shippingTotal += _getShippingCost(p.shipping);
      count = count + 1;
    }
    double total = subtotal + shippingTotal;

    return Scaffold(
      appBar: AppBar(
        title: TextView(
          txt: AppConstants.checkout,
          weight: FontWeight.normal,
          size: AppConstants.sixteen,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pushNamed(context, RouteNames.homeScreen),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.sixteen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildProductList()),
            SizedBox(height: AppConstants.twelve),
            _buildTotal(subtotal, shippingTotal, total, count),
            SizedBox(height: AppConstants.twelve),
            _buildFinalizeButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildCartItemCard(products[index]);
      },
    );
  }

  Widget _buildTotal(
      double subtotal, double shipping, double total, int countValue) {
    return Column(
      children: [
        _totalRow(AppConstants.subtotal, subtotal, count: countValue),
        _totalRow(AppConstants.shipping, shipping),
        _totalRow(AppConstants.total, total, isBold: true),
        const Divider(),
      ],
    );
  }

  Widget _totalRow(String label, double amount,
      {int? count, bool isBold = false}) {
    String displayLabel = count != null ? '$label ($count items)' : label;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppConstants.four),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
              txt: displayLabel,
              weight: isBold ? FontWeight.bold : FontWeight.normal,
              size: AppConstants.sixteen,
              color: Colors.black),
          TextView(
              txt: '₹ ${amount.toStringAsFixed(2)}',
              weight: isBold ? FontWeight.bold : FontWeight.normal,
              size: AppConstants.sixteen,
              color: Colors.black)
        ],
      ),
    );
  }

  Widget _buildFinalizeButton(BuildContext context) {
    return ActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(AppConstants.successText),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      },
      label: AppConstants.purchaseButtonTxt,
      labelColor: Colors.white,
      backgroundColor: Colors.green,
    );
  }

  Widget _buildCartItemCard(Product item) {
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
                    txt: item.name,
                    weight: FontWeight.bold,
                    size: AppConstants.sixteen,
                    color: Colors.black,
                  ),
                  SizedBox(height: AppConstants.eight),
                  TextView(
                    txt: "₹ ${item.price.toStringAsFixed(2)}",
                    weight: FontWeight.normal,
                    size: AppConstants.forTeen,
                    color: Colors.black,
                  ),
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
