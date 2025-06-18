abstract class ProductSelectionState {}

class ProductSelectionInitial extends ProductSelectionState {}

class ProductSelectionLoadedState extends ProductSelectionState {
  final bool isFavorite;
  final bool isInCart;

  ProductSelectionLoadedState({
    required this.isFavorite,
    required this.isInCart,
  });
}