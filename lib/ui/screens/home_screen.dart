import 'package:flutter/material.dart';
import 'package:shopping_cart/ui/screens/screens.dart';
import '../../assets/app_images.dart';
import '../../constants/constants.dart';
import '../../data/models/model.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  final List<Product> products = [
    Product(
        imagePath: 'lib/assets/images/iphone_black.png',
        name: 'Apple iPhone 16',
        price: 84900,
        shipping: 'Free Shipping',
        groupId: 'phone'
    ),
    Product(
        imagePath: 'lib/assets/images/bicycle_blue.png',
        name: 'BMX Cycle',
        price: 100000,
        shipping: 'Shipping Cost 200',
        groupId: 'cycle'
    ),
    Product(
        imagePath: 'lib/assets/images/smart_tv_three.png',
        name: 'Samsung 120 cm',
        price: 25000,
        shipping: 'Shipping Cost 500',
        groupId: 'tv'
    ),
    Product(
        imagePath: 'lib/assets/images/iphone_green.png',
        name: 'Apple iPhone 16',
        price: 90000,
        shipping: 'Shipping Cost 200',
        groupId: 'phone'
    ),
    Product(
        imagePath: 'lib/assets/images/bicycle_violet.png',
        name: 'BMX Cycle',
        price: 100000,
        shipping: 'Shipping Cost 200',
        groupId: 'cycle'
    ),
    Product(
        imagePath: 'lib/assets/images/smart_tv_one.png',
        name: 'Samsung 80 cm',
        price: 14490,
        shipping: 'Shipping Cost 200',
        groupId: 'tv'
    ),
    Product(
        imagePath: 'lib/assets/images/iphone_white.png',
        name: 'Apple iPhone 16',
        price: 88000,
        shipping: 'Shipping Cost 700',
        groupId: 'phone'
    ),
    Product(
        imagePath: 'lib/assets/images/bicycle_green.png',
        name: 'BMX Cycle',
        price: 100000,
        shipping: 'Shipping Cost 200',
        groupId: 'cycle'
    ),
    Product(
        imagePath: 'lib/assets/images/smart_tv_two.png',
        name: 'Samsung 120 cm',
        price: 24000,
        shipping: 'Shipping Cost 500',
        groupId: 'tv'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndexNotifier,
        builder: (context, index, _) {
          return _buildBody(index);
        },
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildHotSalesTitle(),
            _buildProductList(),
          ],
        );
      case 1:
        return const CartWishListScreen(isFrom: true);
      case 2:
        return const CartWishListScreen(isFrom: false);
      case 3:
        return const ProfileScreen();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildHeader() => SafeArea(child: AppImages().logo2);

  Widget _buildHotSalesTitle() {
    return Padding(
      padding: EdgeInsets.only(left: AppConstants.sixteen),
      child: Text(
        AppConstants.hotSales,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: AppConstants.twentyFour,
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: products
            .map((product) => _buildProductCard(product))
            .toList(),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.productDetail,
          arguments: product,
        );
      },
      child: Padding(
        padding: EdgeInsets.all(AppConstants.eight),
        child: Card(
          color: const Color(0xffE7EBFF),
          child: Column(
            children: [
              Hero(
                tag: product.imagePath,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.twelve),
                  child: Padding(
                    padding: EdgeInsets.all(AppConstants.twelve),
                    child: Image.asset(
                      product.imagePath,
                      height: AppConstants.paddingOneFifty,
                      width: AppConstants.paddingOneFifty,
                    ),
                  ),
                ),
              ),
              TextView(
                txt: product.name,
                weight: FontWeight.normal,
                size: AppConstants.forTeen,
                color: Colors.black,
              ),
              SizedBox(height: AppConstants.two),
              TextView(
                txt: '₹ ${product.price.toStringAsFixed(2)}',
                weight: FontWeight.bold,
                size: AppConstants.sixteen,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: AppConstants.eight, bottom: AppConstants.sixteen),
                child: FreeShipping(shipping: product.shipping),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndexNotifier,
      builder: (context, index, _) {
        return BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (int newIndex) {
            _selectedIndexNotifier.value = newIndex;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppConstants.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: AppConstants.cart,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: AppConstants.wishlist,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppConstants.profile,
            ),
          ],
        );
      },
    );
  }
}
