import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/product_selection_bloc.dart';
import 'constants/constants.dart';
import 'data/models/product.dart';
import 'ui/screens/screens.dart';

sealed class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onboarding:
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: RouteNames.onboarding,
          ),
          builder: (context) => const OnboardingScreen(),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: RouteNames.homeScreen,
          ),
          builder: (context) =>  const HomeScreen(),
        );
      case RouteNames.productDetail:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (context) => ProductSelectionBloc(),
            child: ProductDetailScreen(product: product),
          ),
        );

      case RouteNames.cartWishListScreen:
        final bool isFrom = settings.arguments as bool;
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: RouteNames.cartWishListScreen,
          ),
          builder: (context) =>  CartWishListScreen(isFrom: isFrom,),
        );
      case RouteNames.checkOut:
        final args = settings.arguments;
        if (args is List<Product>) {
          return MaterialPageRoute(
            builder: (_) => CheckoutScreen(products: args),
          );
        }
      case RouteNames.profileScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: RouteNames.profileScreen,
          ),
          builder: (context) =>  const ProfileScreen(),
        );


      default:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.onboarding),
          builder: (context) => const OnboardingScreen(),
        );
    }
    return null;
  }
}
