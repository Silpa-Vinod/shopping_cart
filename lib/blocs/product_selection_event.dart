import '../data/models/product.dart';

abstract class ProductSelectionEvent {}

class ToggleWishList extends ProductSelectionEvent {}

class AddToCart extends ProductSelectionEvent {}
class LoadProductVariant extends ProductSelectionEvent {
  final Product selectedProduct;

  LoadProductVariant(this.selectedProduct);
}
