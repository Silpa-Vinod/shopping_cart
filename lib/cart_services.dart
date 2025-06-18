import 'data/models/model.dart';

class CartService {
  static final List<CartItem> cartItems = [];

  static void addToCart(Product product) {
    cartItems.add(
      CartItem(
        title: product.name,
        price: product.price,
        imagePath: product.imagePath,
        shipping: product.shipping,
          groupId: product.groupId
      ),
    );
  }

  static List<CartItem> getCartItems() {
    return cartItems;
  }
}


