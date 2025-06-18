import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/product_selection_bloc.dart';
import '../../blocs/product_selection_event.dart';
import '../../blocs/product_selection_state.dart';
import '../../cart_services.dart';
import '../../constants/constants.dart';
import '../../data/models/product.dart';
import '../widgets/widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductSelectionBloc, ProductSelectionState>(
          builder: (context, state) {
            bool isFavorite = false;
            bool isInCart = false;

            if (state is ProductSelectionLoadedState) {
              isFavorite = state.isFavorite;
              isInCart = state.isInCart;
            }

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.sixteen,
                vertical: AppConstants.twelve,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopBar(context, isFavorite),
                  _buildProductImage(),
                  SizedBox(height: AppConstants.sixteen),
                  _buildProductInfo(),
                  const Spacer(),
                  _buildActionButtons(context, isInCart),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, bool isFavorite) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        IconButton(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isFavorite
                ? const Icon(Icons.favorite,
                color: Colors.red, key: ValueKey(true))
                : const Icon(Icons.favorite_border, key: ValueKey(false)),
          ),
          onPressed: () {
            context.read<ProductSelectionBloc>().add(ToggleWishList());
          },
        ),
      ],
    );
  }

  Widget _buildProductImage() {
    return Center(
      child: Hero(
        tag: product.imagePath,
        child: Image.asset(
          product.imagePath,
          height: AppConstants.tweFifty,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(txt:product.name, weight: FontWeight.bold,
            size:AppConstants.twentyFour,color: Colors.black),

        Padding(
          padding: EdgeInsets.symmetric(vertical: AppConstants.four),
          child: Row(
            children: [
              TextView(txt:'₹ ${product.price.toStringAsFixed(2)}', weight: FontWeight.bold,
                  size:AppConstants.sixteen,color: Colors.green),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: AppConstants.eight),
                child: Container(
                  width: AppConstants.two,
                  height: AppConstants.sixteen,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(AppConstants.sixteen),
                  ),
                ),
              ),
              TextView(txt:AppConstants.tax, weight: FontWeight.normal,
                  size:AppConstants.twelve,color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, bool isInCart) {
    return Column(
      children: [
        ActionButton(
          onPressed: () {
            if (isInCart) {
              Navigator.pushNamed(
                context,
                RouteNames.cartWishListScreen,
                arguments: true,
              );
            } else {
              context.read<ProductSelectionBloc>().add(AddToCart());
              CartService.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(AppConstants.addedToCart)),
              );
            }
          },
          label:
          isInCart ? AppConstants.goToCart : AppConstants.addToCart,
          labelColor: Colors.white,
          backgroundColor: isInCart ? Colors.grey : Colors.black,
        ),
        SizedBox(height: AppConstants.eight),
        ActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              RouteNames.checkOut,
              arguments: [product],
            );

          },
          label: AppConstants.buyNow,
          labelColor: Colors.white,
          backgroundColor: Colors.green,
        ),
      ],
    );
  }
}
