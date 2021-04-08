//screen to navagit for it

import './views/category/category_product_details_screen.dart';
import './views/product/product_details_screen.dart';
import './views/home/main_screen.dart';
import './views/auth/login_screen.dart';
import './views/auth/register_screen.dart';
import './views/onboarding_screen.dart';

//theme and ui
import './theme/theme.dart';

//providers
import './providers/cart/cart_provider.dart';
import './providers/category/catergory_provider.dart';
import './providers/products/products_provider.dart';
import './providers/favorite/order_provider.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Category(),
        ),
        ChangeNotifierProvider(
          create: (context) => Product(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Order(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        home: OnbardingScreen(),
        routes: {
          RegisterScreen.routeNamed: (ctx) => RegisterScreen(),
          LoginScreen.routeNamed: (ctx) => LoginScreen(),
          MainScreen.routeNamed: (ctx) => MainScreen(),
          ProductOfCategoryScreen.routeNamed: (ctx) =>
              ProductOfCategoryScreen(),
          ProductDetailsScreen.routeNamed: (ctx) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
