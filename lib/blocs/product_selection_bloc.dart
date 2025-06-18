import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_selection_event.dart';
import 'product_selection_state.dart';

class ProductSelectionBloc
    extends Bloc<ProductSelectionEvent, ProductSelectionState> {
  bool _isFavorite = false;
  bool _isInCart = false;

  ProductSelectionBloc()
      : super(ProductSelectionLoadedState(isFavorite: false, isInCart: false)) {
    on<ToggleWishList>((event, emit) {
      _isFavorite = !_isFavorite;
      emit(ProductSelectionLoadedState(
          isFavorite: _isFavorite, isInCart: _isInCart));
    });

    on<AddToCart>((event, emit) {
      _isInCart = true;
      emit(ProductSelectionLoadedState(
          isFavorite: _isFavorite, isInCart: _isInCart));
    });
  }
}
